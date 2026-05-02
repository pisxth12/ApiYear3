<?php

namespace App\Filament\Resources\Contacts\Pages;

use App\Filament\Resources\Contacts\ContactResource;
use Filament\Resources\Pages\Page;

class ListContact extends Page
{
    protected static string $resource = ContactResource::class;

    protected function getTableHeaderActions(): array
    {
        return [];
    }

    protected function getActions(): array
    {
        return [];
    }
}
