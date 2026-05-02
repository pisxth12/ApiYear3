<?php

namespace App\Filament\Resources\Products\Schemas;

use Filament\Forms\Components\FileUpload;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\CheckboxColumn;
use Illuminate\Support\Str;

class ProductForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->maxLength(255)
                    ->live()
                    ->afterStateUpdated(fn($state, callable $set) => $set('slug', Str
                        ::slug($state))),

                TextInput::make('slug')
                    ->required()
                    ->unique('products', 'slug'),



                Select::make('category_id')
                    ->relationship('category', 'name')
                    ->required()
                    ->searchable()
                    ->preload(),

                Select::make('brand_id')
                    ->relationship('brand', 'name')
                    ->searchable()
                    ->preload()
                    ->nullable(),

                TextInput::make('price')
                    ->required()
                    ->numeric()
                    ->prefix('$')
                    ->maxValue(999999.99),

                TextInput::make('sale_price')
                    ->numeric()
                    ->nullable()
                    ->prefix('$'),

                TextInput::make('stock')
                    ->required()
                    ->numeric()
                    ->default(0)
                    ->minValue(0),

                Select::make('is_active')
                    ->label('Active')
                    ->options([
                        true => 'Active',
                        false => 'Inactive',
                    ])
                    ->default(true),

                Textarea::make('description')
                    ->maxLength(65535)
                    ->rows(3)
                    ->columnSpanFull(),

                FileUpload::make('image')
                    ->image()
                    ->directory('products')
                    ->visibility('public')
                    ->disk('public')
                    ->imagePreviewHeight(150)
                    ->acceptedFileTypes(['image/jpeg', 'image/jpg', 'image/png', 'image/webp'])
                    ->maxSize(51200)
                    ->nullable()
                    ->required(fn(string $operation): bool => $operation === 'create'),


                Toggle::make('is_featured')
                    ->label('Featured')
                    ->default(false)
                    ->inline(false),


            ]);
    }
}
