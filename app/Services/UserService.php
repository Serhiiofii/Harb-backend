<?php

namespace App\Services;

use App\Models\CartItem;
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

            return $this->success('success', null, $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function updatePassword(array $data)
    {
        try {
            $user = User::where('id',auth()->user()->id)->first();
            if($user == null) {
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
            $notifications = UserNotification::where('user_id',auth()->user()->id)->get();
            return $this->success('success', 'Notifications retrieved successfully', $notifications->load('user'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getCartItems()
    {
        try {
            $cart_items = CartItem::where('user_id', auth()->user()->id)->get();
            return $this->success('success', 'Cart items retrieved successfully', $cart_items->load('user'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }


    



    

}
