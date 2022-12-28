<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Payment;
use App\Models\PlacedOrder;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\Service;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
// use Illuminate\Contracts\Database\Query\Builder;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Http;

class OrderService
{
    use ApiResponse, SaveImage;

    public function getAll()
    {
        try {
            // in_progress, declined, sucessful
            $orders = PlacedOrder::all();
            $ongoing = PlacedOrder::where('status','in_progress')->count();
            $declined = PlacedOrder::where('status', 'declined')->count();

            return $this->success('success', 'Orders retrieved successfully', [
                'orders' => $orders,
                'total' => count($orders),
                'ongoing' => $ongoing,
                'declined' => $declined,
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function search(array $data)
    {
        try {
            $result = PlacedOrder::whereHas('users', function(Builder $query) use ($data) {
                $query->where('first_name','like', '%' . $data['search'] . '%')->
                orWhere('last_name', 'like', '%' . $data['search'] . '%');
            })->orWhereHas('sellers', function (Builder $query) use ($data) {
                $query->where('company_name', 'like', '%' . $data['search'] . '%');
            })->orWhere('details', 'like', '%' . $data['search'] . '%')->orWhere('amount', 'like', '%' . $data['search'] . '%')->get();
            

            return $this->success('success', 'Search successful', $result, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
