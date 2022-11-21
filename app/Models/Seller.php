<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seller extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function businessDocuments()
    {
        return $this->hasMany(SellerDocument::class);
    }

    public function businessAccounts()
    {
        return $this->hasMany(SellerBusinessAccount::class);
    }
}
