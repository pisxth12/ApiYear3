<?php

namespace App\Filament\Resources\Categories\Schemas;

use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;
use Filament\Tables\Columns\ToggleColumn;
use Illuminate\Support\Str;

class CategoryForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                ->required()
                ->maxLength(255)
                ->live()
            ->afterStateUpdated(fn(string $operation, $state, callable $set) => $set('slug', Str::slug($state))),
                TextInput::make('slug')
                    ->unique('categories', 'slug')
                ->required(),
                TextInput::make('description')
                ->nullable(),
                FileUpload::make('image')
                    ->image()
                    ->directory('categories')
                    ->disk('public')
                    ->visibility('public')
                    ->imagePreviewHeight(150)
                    ->acceptedFileTypes(['image/jpeg', 'image/jpg', 'image/png', 'image/webp'])
                    ->maxSize(51200)
                ->required(),
                Toggle::make('is_active')
                ->label('Active')
                ->default(true),

            ]);
    }
}
