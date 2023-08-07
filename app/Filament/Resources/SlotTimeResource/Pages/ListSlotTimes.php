<?php

namespace App\Filament\Resources\SlotTimeResource\Pages;

use App\Filament\Resources\SlotTimeResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListSlotTimes extends ListRecords
{
    protected static string $resource = SlotTimeResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
