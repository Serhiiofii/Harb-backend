<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Equipment extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function equipmentImages()
    {
        return $this->hasMany(EquipmentImage::class);
    }
    public function customSpecifications()
    {
        return $this->hasMany(EquipmentCustomSpecification::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function productQuote()
    {
        return $this->hasMany(ProductQuote::class);
    }

}
