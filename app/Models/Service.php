<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory,ModelTrait;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
