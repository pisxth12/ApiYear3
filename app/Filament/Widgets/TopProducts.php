<?php

namespace App\Filament\Widgets;

use App\Models\Product;
use Filament\Actions\BulkActionGroup;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget;
use Illuminate\Database\Eloquent\Builder;

class TopProducts extends TableWidget
{
    protected static ?int $sort = 4;
    protected int|string|array $columnSpan = 'full';

    public function table(Table $table): Table
    {

        return $table
            ->query(Product::query()->where('is_active', true)->orderBy('stock', 'asc')->limit(5))
            ->columns([
                ImageColumn::make('image')
                    ->width(50)
                    ->height(50),
                TextColumn::make('name')
                    ->searchable()
                    ->label('Product Name'),
                TextColumn::make('sku')
                    ->label('SKU'),
                TextColumn::make('price')
                    ->money('USD')
                    ->label('Price'),
                TextColumn::make('stock')
                    ->label('Stock')
                    ->color(fn(string $state): string => match (true) {
                        $state <= 5 => 'danger',
                        $state <= 10 => 'warning',
                        default => 'success',
                    }),
                TextColumn::make('category.name')
                    ->label('Category'),

            ])
            ->filters([
                //
            ])
            ->headerActions([
                //
            ])
            ->recordActions([
                //
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    //
                ]),
            ]);
    }
}
