<?php

namespace App\Filament\Resources\Settings\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class SettingForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextInput::make('key')
                    ->required()
                    ->maxLength(255)
                    ->disabled()
                    ->helperText('Key cannot be changed once created'),
                TextInput::make('value')
                    ->required()
                    ->maxLength(65535)
                    ->helperText('Phone, email, URL, or text value'),
            ]);
    }
}
