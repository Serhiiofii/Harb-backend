<?php

namespace App\Services;

use App\Models\UserNotification;
use App\Traits\ApiResponse;

class UserNotificationService
{
    use ApiResponse;

    public function notifyUser(array $data)
    {
        try {
            UserNotification::create($data);
            return true;
        } catch (\Throwable $th) {
            return $this->error('error', $th->getMessage(), null, 500);
        }
    }
}