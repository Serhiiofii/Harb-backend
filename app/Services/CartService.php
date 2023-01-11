<?php

namespace App\Services;

use App\Http\Requests\CartRequest;
use App\Models\CartItem;
use App\Traits\ApiResponse;

class CartService
{
    use ApiResponse;

    public function addToCart(array $data)
    {
        try {
            $cartItem = CartItem::where('user_id', $data['user_id'])->first();
            if ($cartItem) {
                $checkout_id = $cartItem->checkout_id;
            }
            // dd($data['equipment_id']);
            // dd(array_key_exists('equipment_id', $data));
            $cart = CartItem::create([
                'user_id' => $data['user_id'],
                'bid_amount' => $data['bid_amount'],
                'equipment_id' => array_key_exists('equipment_id', $data) ? $data['equipment_id'] : null,
                // 'service_id' => in_array('service_id', $data) ? $data['service_id'] : null,
                'checkout_id' => $cartItem != null ? $checkout_id : $data['checkout_id']
            ]);
            return true;
        } catch (\Throwable $th) {
            return $this->error('error', $th->getMessage(), null, 500);
        }
    }
}
