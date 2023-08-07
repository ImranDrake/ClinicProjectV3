<?php

namespace App\Livewire;

use App\Models\Consultation;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Payment;
use Carbon\Carbon;
use Twilio\Rest\Client;
use Livewire\Component;

class DetailPage extends Component
{
    public $doctorid;
    public $patient;
    public $consultation;
    public $description;
    public $image;

    public $payment;


    public function mount(){

        $this->image = Doctor::find(session('tab'));
        $this->doctorid = Doctor::find(session('tab'));
        // dd($this->image);
        $this->patient = Patient::find(session('patient_name'));
        $this->consultation = Consultation::find(session('consultation_name'));

        // $this->consultation = Consultation::create([
        //     'doctor_id' =>  session('tab'),
        //     'patient_id'=> session('patient_name'),
        //     'consultation_date_time' => session('tab2').' '.session('slot1'),
        //     'health_concerns' => session('decription_name'),
        //     'is_paid' => 1,
        //    ]);

           $this->payment = Payment::create([
            'patient_id' => session('patient_name'),
            'consultation_id' => $this->consultation->id,
            'amount' => $this->doctorid->fee,
            'payment_status' => 'success',
            'transaction_id' => session('transaction_id'),
            'payment_date' => Carbon::today()->format('Y/m/d'),

           ]);
    }
    public function render()
    {
       
       // dd($this->doctorid->name);
        return view('livewire.detail-page');
    }
}
