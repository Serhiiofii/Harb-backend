<?php

namespace App\Models;

use App\Traits\ModelTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SupportMessageImage extends Model
{
    use HasFactory, ModelTrait;

    protected $guarded = [];

    public function supportMessage()
    {
        return $this->belongsTo(SupportMessage::class, 'support_message_id');
    }
}
