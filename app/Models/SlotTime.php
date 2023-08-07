<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SlotTime extends Model
{
    use HasFactory;

    protected $fillable = ['slot_id', 'time', 'is_available'];

    protected $casts = [
        'is_admin' => 'boolean',
    ];

    public function slot()
    {
        return $this->belongsTo(Slot::class);
    }
   

}