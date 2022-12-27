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
use Illuminate\Support\Facades\Http;

class OrderService
{
    use ApiResponse, SaveImage;

    

    public function getAll()
    {
        try {
            // in_progress, declined
            $orders = PlacedOrder::all();
            $total = PlacedOrder::count();
            $ongoing = PlacedOrder::where('status','in_progress')->count();
            $declined = PlacedOrder::where('status', 'declined')->count();

            return $this->success('success', 'Orders retrieved successfully', [
                'orders' => $orders,
                'total' => $total,
                'ongoing' => $ongoing,
                'declined' => $declined,
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
