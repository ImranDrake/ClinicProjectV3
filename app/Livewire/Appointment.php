<?php

namespace App\Livewire;

use App\Models\Consultation;
use App\Models\Doctor;
use App\Models\Slot;
use App\Models\SlotTime;
use Livewire\Component;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Livewire\Attributes\On;

class Appointment extends Component
{
    public $counts = [];
    public $doctors;
    public $dates;
    public $month;
    public $date;
    public $day;
    public $startDate;
    public $endDate;
    public $tabs;
    public function booking($tab)
    {
        $this->tabs = $tab;
    }

    #[On('timeAdded')]
    public function time_booking($doctor_id, $book_date, $book_time)
    {
        session(['tab' => $doctor_id]);
        session(['tab2' => $book_date]);
        session(['slot1' => $book_time]);
        return redirect()->to('/information');
    }
    public $Doc;

    public $periods = [];
    public function getDoc($getdoc)
    {
        $this->Doc = $getdoc;

        $this->periods = Slot::where('doctor_id', $this->Doc)
            ->where('date', '>=', Carbon::today())
            ->orderBy('date')
            ->pluck('date', 'id')
            ->unique()
            ->toArray();
    }
    public $getDates = [];
    public $Dat;
    public $mrnghours = [];
    public $aftnhours = [];
    public $evnhours = [];

    public $dateStr;
    public $consultTable;

    public $Dart;


    public function getDate($Date, $dart)
    {

        $this->Dart = $dart;

        $this->Dat = $Date;

        $this->getDates = SlotTime::where('slot_id', $this->Dat)
            // ->where('time', '>=', Carbon::now())
            ->orderBy('time')
            ->pluck('time', 'id')
            ->unique()
            ->toArray();
        $this->mrnghours = [];
        $this->aftnhours = [];
        $this->evnhours = [];
        foreach ($this->getDates as $time) {
            if ($time < '12.00.00') {
                $this->mrnghours[] = $time;
            } elseif ($time > '12.00.00' && $time <= '16:00:00') {
                $this->aftnhours[] = $time;
            } else
                $this->evnhours[] = $time;
        }

        $this->consultTable = Consultation::where('is_paid', 1)
            ->where('doctor_id', $this->Doc)
            ->pluck('consultation_date_time')
            ->toArray();
        //   dd($this->Dart);
    }
    public function mount()
    {
        $this->doctors = Doctor::all();
        // $this->dates = Slot::all();
        $this->dates = Carbon::now();
        $this->month = Carbon::today()->format('F');
    }
    public function sessiondata1()
    {
        $this->emit('postAdded',);
    }

    public function render()
    {
        return view('livewire.appointment');
    }
}
