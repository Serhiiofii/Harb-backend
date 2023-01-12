<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminRole extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function admin()
    {
        return $this->belongsTo(User::class);
    }
}
