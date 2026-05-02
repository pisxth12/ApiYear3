<?php

namespace App\Filament\Widgets;

use App\Models\Product;
use Filament\Actions\BulkActionGroup;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use Illuminate\Database\Eloquent\Builder;

class LowStockAlert extends BaseWidget
{

    protected static ?int $sort = 3;

    public function table(Table $table): Table
    {


             return $table
                 ->query(Product::where('stock', '<=', 10))
                 ->columns([
                     ImageColumn::make('image'),
                     TextColumn::make('name'),
                     TextColumn::make('stock')
                         ->color(fn($state) => $state <= 5 ? 'danger' : 'warning'),
                     TextColumn::make('sku'),
                 ]);
    }
}
