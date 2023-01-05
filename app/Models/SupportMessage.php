<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupportMessage extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function sender()
    {
        return $this->belongsTo(User::class, 'sender');
    }

    public function sentTo()
    {
        return $this->belongsTo(User::class, 'sent_to');
    }

    public function supportImages()
    {
        return $this->hasMany(SupportMessageImage::class,'support_message_id');
    }
    


}
