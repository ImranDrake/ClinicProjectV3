<?php

namespace App\Filament\Resources\SlotTimeResource\Pages;

use App\Filament\Resources\SlotTimeResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateSlotTime extends CreateRecord
{
    protected static string $resource = SlotTimeResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
