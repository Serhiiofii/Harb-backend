<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Payment;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\Service;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Mail;
use PhpParser\Node\Expr\BinaryOp\Equal;

class AdminService
{
    use ApiResponse, SaveImage;
    
    public function createAdmin(array $data)
    {
        try {
            $admin = User::create([
                'first_name' => $data['first_name'],
                'last_name' => $data['last_name'],
                'email' => $data['email'],
                'phone' => $data['phone'],
                'password' => $data['password'],
                'user_role' => 'admin'
            ]);

            Mail::send('emails.new-admin-account', ['user' => $data], function ($message) use ($data) {
                $message->from(config('mail.from.address'));
                $message->subject('Administrator Account Created Successfully');
                $message->to($data['email']);
            });
            return $this->success('success', 'Admin created successfully', $admin, 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getAdmins()
    {
        try {
            $adminAccounts = User::where('user_role','admin')->get();
            return $this->success('success', 'Admin accounts retrieved successfully', $adminAccounts, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    // public function viewUser($id)
    // {
    //     try {
    //         $user = User::where('id', $id)->first()->load('seller', 'sellerDocuments');
    //         if ($user == null) {
    //             return $this->error('error', 'Account not found', null, 400);
    //         }

    //         $sellerEquipments = Equipment::where('seller_id', auth()->user()->id)->with('equipmentImages', 'customSpecifications')->get();
    //         $services = Service::where('seller_id', auth()->user()->id)->get();
    //         $sold_transactions = Payment::where('sale_type', 'sale')->count();
    //         $rented_transactions = Payment::where('sale_type', 'rent')->count();
    //         $docs = SellerDocument::where('seller_id', $id)->get();

    //         return $this->success('success', 'successful', [
    //             'user' => $user,
    //             'equipments' => $sellerEquipments,
    //             'services' => $services,
    //             'sold_transactions' => $sold_transactions,
    //             'rented_transactions' => $rented_transactions,
    //             'documents' => $docs
    //         ], 200);
    //     } catch (\Throwable $e) {
    //         return $this->error('error', $e->getMessage(), null, 500);
    //     }
    // }

    // public function searchUser($data)
    // {
    //     try {
    //         $result = User::where('first_name', 'like', '%' . $data['search'] . '%')->orWhere('last_name', 'like', '%' . $data['search'] . '%')->orWhere('email', 'like', '%' . $data['search'] . '%')->get();
    //         if ($result == null) {
    //             return $this->error('error', 'Account not found', null, 400);
    //         }

    //         return $this->success('success', 'Search successful', $result, 200);
    //     } catch (\Throwable $e) {
    //         return $this->error('error', $e->getMessage(), null, 500);
    //     }
    // }

    // public function deleteAccount($id)
    // {
    //     try {
    //         User::where('id', $id)->first()->delete();
    //         return $this->success('success', 'Account deleted successfully', null, 200);
    //     } catch (\Throwable $e) {
    //         return $this->error('error', $e->getMessage(), null, 500);
    //     }
    // }
}
