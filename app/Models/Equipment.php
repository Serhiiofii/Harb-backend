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


}
