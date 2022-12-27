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
use Illuminate\Support\Facades\Http;
use PhpParser\Node\Expr\BinaryOp\Equal;

class AccountService
{
    use ApiResponse, SaveImage;

    public function getDashboardData()
    {
        try {
            $total_users = User::count();
            $active_customers = User::where('last_login','<=',Carbon::now()->subDays(21))->count();
            $total_equipments = Equipment::count();
            $recent_transactions = Payment::orderBy('updated_at','desc')->get();
            $total_services = Service::count();
            $active_services = 0;
            $clicked_services = 0;
            $rented_equipments = Equipment::where('sale_type','rent')->count();
            $sold_equipments = Equipment::where('sale_type','sale')->count();

            return $this->success('success', 'Successful', [
                'total_users' => $total_users,
                'active_customers' => $active_customers,
                'total_equipments' => $total_equipments,
                'recent_transactions' => $recent_transactions->load('user'),
                'total_services' => $total_services,
                'active_services' => $active_services,
                'clicked_services' => $clicked_services,
                'total_products' => $total_equipments,
                'rented_products' => $rented_equipments,
                'sold_products' => $sold_equipments,
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
    
    public function listUsers()
    {
        try {
            $userAccounts = User::all();
            return $this->success('success', 'Accounts retrieved successfully', $userAccounts,200);
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
