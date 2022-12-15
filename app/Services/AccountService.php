<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\Service;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class AccountService
{
    use ApiResponse, SaveImage;
    
    public function listUsers()
    {
        try {
            $userAccounts = User::all();
            return $this->success('success', 'Accounts retrieved2 successfully', $userAccounts,200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function viewUser($id)
    {
        try {
            $user = User::where('id', $id)->first()->load('seller', 'sellerDocuments');
            if($user == null) {
                return $this->error('error','Account not found',null,400);
            }
            $sellerEquipments = Equipment::where('seller_id',auth()->user()->id)->with('equipmentImages', 'customSpecifications')->get();
            $services = Service::where('seller_id',auth()->user()->id)->orWhere('user_id',auth()->user()->id)->get();
            return $this->success('success', 'Account retrieved successfully', ['user' => $user, 'equipments' => $sellerEquipments, 'services' => $services], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
 
    public function searchUser($data)
    {
        try {
            $result = User::where('first_name', 'like', '%'.$data['search'].'%')->orWhere('last_name', 'like', '%' . $data['search'] . '%')->orWhere('email', 'like', '%' . $data['search'] . '%')->get();
            if ($result == null) {
                return $this->error('error', 'Account not found', null, 400);
            }

            return $this->success('success', 'Search successful', $result, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function deleteAccount($id)
    {
        try {
            User::where('id',$id)->first()->delete();
            return $this->success('success', 'Account deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

}
