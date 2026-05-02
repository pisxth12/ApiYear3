<?php

namespace App\Filament\Resources\Banners\Schemas;

use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;

class BannerForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                 TextInput::make('title')
                    ->required()
                    ->maxLength(255),

                TextInput::make('subtitle')
                    ->maxLength(255),

                FileUpload::make('image')
                    ->image()
                    ->directory('banners')
                    ->disk('public')
                    ->visibility('public')
                    ->imagePreviewHeight('150')
                    ->acceptedFileTypes(['image/jpeg', 'image/jpg', 'image/png', 'image/webp'])
                    ->maxSize(102400)
                    ->nullable()
                    ->required(fn (string $operation): bool => $operation === 'create'),
                TextInput::make('url')
                    ->url()
                    ->nullable(),

                TextInput::make('button_text')
                    ->maxLength(255)
                    ->nullable(),

                Select::make('type')
                    ->options([
                        'slider' => 'Slider',
                        'promo' => 'Promotion',
                        'sidebar' => 'Sidebar',
                    ])
                    ->default('slider')
                    ->required(),

                TextInput::make('sort_order')
                    ->numeric()
                    ->default(0)
                    ->minValue(0)
                    ->maxValue(999)
                    ->label('Sort Order'),

                DatePicker::make('start_date')
                    ->nullable(),

                DatePicker::make('end_date')
                    ->nullable(),

                Toggle::make('is_active')
                    ->default(true),
            ]);
    }
}
