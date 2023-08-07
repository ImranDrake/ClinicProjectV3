<?php

namespace App\Livewire;

use App\Models\Consultation;
use App\Models\Doctor;
use App\Models\Patient;
use Livewire\Component;
use PhpParser\Comment\Doc;
use Twilio\Rest\Client;

class Confirm extends Component
{ 
    public $doctorid;
    public $patient;

    public $consultation;
    public function render()
    {
        // dd(session('decription_name'));
        $this->doctorid = Doctor::find(session('tab'));
        $this->patient = Patient::find(session('patient_name'));
        $this->consultation = Consultation::find(session('consultation_name'));
        

        return view('livewire.confirm');
    }
    public function message()
    {
        // dd('Testing'); 
        $this->doctorid = Doctor::find(session('tab'));
        $bookeddate = session('tab2'); 
        $bookedtime = date("h:i A", strtotime(session('slot1')));
        $sid    = "ACf0572aabbbbea02532b375913a4cec2c";
        $token  = "e8b917fd8f6b1203cf2570b8aa93bec4";
        $twilio = new Client($sid, $token);
        // dd('TEsting');

        

        $message = $twilio->messages
            ->create(
                "whatsapp:+917708809112", // to
                array(
                    "from" => "whatsapp:+14155238886",
                    "body" => "Your Appointment has been confirmed with {$this->doctorid->name} on {$bookeddate} at {$bookedtime}"
                )
            );
            return view('detail-page');
    }
}
