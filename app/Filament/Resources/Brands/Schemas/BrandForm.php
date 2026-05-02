<?php

namespace App\Filament\Resources\Brands\Schemas;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\ToggleColumn;
use Illuminate\Support\Str;

class BrandForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                ->required()
                ->maxLength(255)
                ->live()
                ->afterStateUpdated(fn(string $operation, $state, callable $set) => $set('slug', Str::slug($state)))
                ->required(),
                TextInput::make('slug')
                    ->unique('brands', 'slug')
                    ->required(),
                FileUpload::make('logo')
                ->image()
                    ->disk('public')
                ->visibility('public')
                ->imagePreviewHeight(150)
                    ->acceptedFileTypes(['image/jpeg', 'image/jpg', 'image/png', 'image/webp'])
                    ->maxSize(51200)
                    ->directory('brands')
                    ->nullable()
                    ->required(fn (string $operation): bool => $operation === 'create'),
                Toggle::make('is_active')
                ->label('Active')
                    ->default(true),

            ]);

    }
}
