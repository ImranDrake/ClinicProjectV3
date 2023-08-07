<?php

namespace App\Filament\Resources\SlotTimeResource\Pages;

use App\Filament\Resources\SlotTimeResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditSlotTime extends EditRecord
{
    protected static string $resource = SlotTimeResource::class;
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
