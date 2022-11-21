<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SellerBusinessAccount extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function seller()
    {
        return $this->belongsTo(Seller::class,'seller_id');
    }
}
