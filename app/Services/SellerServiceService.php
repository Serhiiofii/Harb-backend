<?php

namespace App\Services;

use App\Models\Service;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class SellerServiceService
{
    use ApiResponse, SaveImage;

    public function addService(array $data)
    {
        try {
            // $data['user_id'] = auth()->user()->id;
            $data['seller_id'] = auth()->user()->id;
            $userService = Service::create($data);
            return $this->success('success', 'Service added successfully', $userService->load('user'), 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }


}