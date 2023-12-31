<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserNotification extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function equipment()
    {
        return $this->hasOne(Equipment::class, 'equipment_id');
    }

    public function quote()
    {
        return $this->belongsTo(ProductQuote::class, 'quote_id');
    }
}
