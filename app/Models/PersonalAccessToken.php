<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\PersonalAccessToken as BasePersonalAccessToken;

class PersonalAccessToken extends BasePersonalAccessToken
{
    use HasFactory, ModelTrait;

    public function tokenable()
    {
        return $this->morphTo('tokenable', "tokenable_type", "tokenable_id");
    }
}
