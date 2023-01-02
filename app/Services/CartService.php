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
                $reference_id = $cartItem->reference;
            }
            $cart = CartItem::create([
                'user_id' => $data['user_id'],
                'item_id' => $data['item_id'],
                'reference' => $cartItem != null ? $reference_id : $data['reference_id']
            ]);
            return true;
        } catch (\Throwable $th) {
            return $this->error('error', $th->getMessage(), null, 500);
        }
    }
}
