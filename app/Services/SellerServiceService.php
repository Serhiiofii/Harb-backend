<?php

namespace App\Services;

use App\Models\BookedService;
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
            // Service::truncate();
            // dd('d');
            $data['seller_id'] = auth()->user()->seller->id;
            $userService = Service::create($data);
            return $this->success('success', 'Service added successfully', $userService->load('seller','seller.user'), 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getAll()
    {
        try {
            $total = Service::count();
            $booked = BookedService::count();
            $unbooked = $total - $booked;
            $services = Service::all();

            return $this->success('success', 'Success', [
                'total_services' => $total,
                'booked_services' => $booked,
                'unbooked_services' => $unbooked,
                'services' => $services->load('seller')
            ], 200);
            
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function delete($id)
    {
        try {
            $service = Service::where('id', $id)->first()->delete();
            return $this->success('success', 'Service deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function search($data)
    {
        try {
            $result = Service::where('name', 'like', '%' . $data['search'] . '%')->orWhere('category', 'like', '%' . $data['search'] . '%')->orWhere('description', 'like', '%' . $data['search'] . '%')->get();
            if ($result == null) {
                return $this->error('error', 'Service not found', null, 400);
            }

            return $this->success('success', 'Search successful', $result, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
