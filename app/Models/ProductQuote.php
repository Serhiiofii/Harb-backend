<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductQuote extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function equipment()
    {
        return $this->belongsTo(Equipment::class,'equipment_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function seller()
    {
        return $this->belongsTo(Seller::class);
    }
}
