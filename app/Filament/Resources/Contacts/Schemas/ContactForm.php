<?php

namespace App\Filament\Resources\Contacts\Schemas;

use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Schema;

class ContactForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('name')
                    ->required()
                    ->disabled()
                    ->maxLength(255),

                TextInput::make('email')
                    ->required()
                    ->disabled()
                    ->email()
                    ->maxLength(255),

                TextInput::make('phone')
                    ->nullable()
                    ->disabled()
                    ->maxLength(50),

                Textarea::make('message')
                    ->required()
                    ->disabled()
                    ->rows(5)
                    ->columnSpanFull(),

                Toggle::make('is_read')
                    ->label('Mark as Read')
                    ->default(false),
            ]);
    }
}
