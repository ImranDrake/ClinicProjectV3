<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'specialization', 'whatsapp_number', 'fee', 'image'];

    public function slots()
    {
        return $this->hasMany(Slot::class);
    }
   
    public function consultations()
    {
        return $this->hasMany(Consultation::class);
    }
    
}
