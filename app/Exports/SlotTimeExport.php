<?php

namespace App\Exports;

use App\Models\SlotTime;
use Filament\Notifications\Collection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromQuery;
use Stripe\Invoice;

class SlotTimeExport implements FromQuery
{
    use Exportable;
    public $slottimes;

    public function __construct(Collection $slottimes){
     $this->slottimes = $slottimes;
    }

    public function query(){
        return SlotTime::whereKey($this->slottimes->pluck('id')->toArray());
    }
}
