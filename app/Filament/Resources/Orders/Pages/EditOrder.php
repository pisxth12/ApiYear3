<?php

namespace App\Filament\Resources\Orders\Pages;

use App\Filament\Resources\Orders\OrderResource;
use Filament\Resources\Pages\EditRecord;
use Filament\Notifications\Notification;

class EditOrder extends EditRecord
{
    protected static string $resource = OrderResource::class;

    protected function mutateFormDataBeforeSave(array $data): array
    {
        $order = $this->record;
        $oldStatus = $order->status;
        $newStatus = $data['status'];

        $this->oldStatus = $oldStatus;

        return $data;
    }

    protected function afterSave(): void
    {
        $order = $this->record;
        $oldStatus = $this->oldStatus ?? $order->getOriginal('status');
        $newStatus = $order->status;

        // Stock deduction when status becomes completed
        if ($newStatus === 'completed' && $oldStatus !== 'completed') {
            foreach ($order->items as $item) {
                $product = $item->product;
                $product->stock -= $item->quantity;
                $product->save();
            }

            Notification::make()
                ->title('Stock deducted')
                ->success()
                ->send();
        }

        if ($oldStatus === 'completed' && $newStatus !== 'completed') {
            foreach ($order->items as $item) {
                $product = $item->product;
                $product->stock += $item->quantity;
                $product->save();
            }

            Notification::make()
                ->title('Stock restored')
                ->warning()
                ->send();
        }
    }
}
