<?php

namespace App\Services;

use App\Models\CartItem;
use App\Models\Equipment;
use App\Models\SavedItem;
use App\Models\Seller;
use App\Models\Service;
use App\Models\User;
use App\Models\UserNotification;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;

class UserService
{
    use ApiResponse, SaveImage;

    public function getProfile()
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            return $this->success('success', null, $user->seller == null ? $user:$user->load('seller'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updatePassword(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }
            if (!Hash::check($data['password'], $user->password)) {
                return $this->error('error', 'Incorrect password', null, 400);
            }
            $user->password = Hash::make($data['password']);
            $user->save();
            $user->refresh();

            return $this->success('success', 'Account password updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updateUserInfo(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            $user->first_name = $data['first_name'];
            $user->last_name = $data['last_name'];
            $user->email = $data['email'];
            $user->phone = $data['phone'];
            $user->save();

            return $this->success('success', 'Account info updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updateDeliveryAddress(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            $user->delivery_address = $data['delivery_address'];
            $user->save();

            return $this->success('success', 'Delivery address updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updateBio(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            $user->bio = $data['bio'];
            $user->save();

            return $this->success('success', 'Bio updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updateLocation(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            $user->location = $data['location'];
            $user->save();

            return $this->success('success', 'Location updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function uploadPhoto(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            if ($user == null) {
                return $this->error('error', 'Account not found', null, 404);
            }

            $user->avatar = $this->saveFile($data['photo']);
            $user->save();

            return $this->success('success', 'Photo updated successfully', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getNotifications()
    {
        try {
            $notifications = UserNotification::where('user_id', auth()->user()->id)->orderBy('created_at', 'desc')->limit(20)->get();
            return $this->success('success', 'Notifications retrieved successfully', $notifications->load('user', 'quote'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getNotification($id)
    {
        try {
            $notification = UserNotification::where('user_id', auth()->user()->id)->where('id', $id)->first();
            $notification->is_read = true;
            $notification->save();
            return $this->success('success', 'Notification retrieved successfully', $notification->load('user'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getCartItems()
    {
        try {
            $cart_items = CartItem::where('user_id', auth()->user()->id)->get();
            $similar_products = Equipment::inRandomOrder()->limit(3)->get();
            $similar_services = Service::inRandomOrder()->limit(3)->get();
            return $this->success('success', 'Cart items retrieved successfully', [
                'cart_items' => $cart_items->load('equipment', 'equipment.equipmentImages', 'equipment.user.seller'),
                'similar_products' => $similar_products->load('equipmentImages'),
                'similar_services' => $similar_services->load('seller', 'seller.user')
            ], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function cancelCartItem($id) {
        $cart_items = CartItem::where('id', $id)->first();
        if ($cart_items) {
            $cart_items->delete();
        }
        return $this->success('success', 'cancel successfully', null, 200);
    }

    public function saveItem($id)
    {
        try {
            $is_equipment = Equipment::where('id', $id)->first();
            $is_service = null;
            if (!$is_equipment) {
                $is_service = Service::where('id', $id)->first();
            }

            $savedItem = SavedItem::create([
                'user_id' => auth()->user()->id,
                'equipment_id' => $is_equipment == null ? null : $is_equipment->id,
                'service_id' => $is_service == null ? null : $is_service->id,
            ]);

            return $this->success('success', 'Item saved successfully', $savedItem->load('equipment', 'service'), 201);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getSavedItems()
    {
        try {
            $saved_items = SavedItem::all();
            return $this->success('success', 'Items retrieved successfully', $saved_items->load('equipment', 'equipment.equipmentImages', 'service'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getService($id)
    {
        try {
            $service_data = Service::where('id', $id)->first();
            return $this->success('success', 'Service details retrieved successfully', $service_data->load('seller', 'seller.user'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getSeller($id)
    {
        try {
            $seller = Seller::where('id', $id)->first();
            $equipments = Equipment::where('seller_id',$id)->limit(9)->get();
            $services = Service::where('seller_id',$id)->limit(3)->get();
            return $this->success('success', 'Service details retrieved successfully', [
                'seller' => $seller->load('user', 'businessAccounts'),
                'equipments' => $equipments->load('equipmentImages'),
                'services' => $services,
            ], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }


    
}
