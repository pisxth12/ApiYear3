<?php

namespace App\Filament\Resources\Contacts\Tables;

use Filament\Actions\BulkAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\CheckboxColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;

class ContactsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('name')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('email')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('phone')
                    ->searchable(),

                TextColumn::make('message')
                    ->limit(50)
                    ->tooltip(function (TextColumn $column): ?string {
                        $state = $column->getState();
                        return strlen($state) > 50 ? $state : null;
                    }),

                CheckboxColumn::make('is_read')
                    ->label('Read'),

                TextColumn::make('created_at')
                    ->label('Submitted')
                    ->dateTime()
                    ->sortable(),
            ])
            ->filters([
                //
            ])
            ->recordActions([
                ViewAction::make()
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                    BulkAction::make('markAsRead')
                    ->label("Read all")
                        ->icon('heroicon-o-check-circle')
                    ->action(fn($records) =>$records->each->update(['is_read' => true]))
                        ->deselectRecordsAfterCompletion(),

                    BulkAction::make('markUnread')
                    ->label("Unread")
                        ->icon('heroicon-o-x-circle')
                    ->action(fn($records) => $records->each->update(['is_read' => false]))
                    ->deselectRecordsAfterCompletion(),
                ]),
            ]);
    }
}
