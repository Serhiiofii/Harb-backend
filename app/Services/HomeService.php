<?php

namespace App\Services;

use App\Events\ForgotPassword;
use App\Models\Equipment;
use App\Models\Payment;
use App\Models\PlacedOrder;
use App\Models\ProductBid;
use App\Models\User;
use App\Traits\ApiResponse;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;
use App\Services\UserNotificationService;
// use App\Services\HomeService;

class HomeService
{
    use ApiResponse;

    public function getDashboardData()
    {
        try {
            //Top selling
            $top_deals = Equipment::orderBy('created_at', 'desc')->skip(0)->take(2)->get();
            $featured_products = Equipment::orderBy('created_at', 'desc')->skip(0)->take(3)->get();
            $recent_sales = PlacedOrder::where('category', 'equipment')->skip(0)->take(3)->with(['equipment', 'equipment.equipmentImages'])->get();
            $most_viewed_products = Equipment::orderBy('view_count', 'desc')->skip(0)->take(6)->with('equipmentImages')->get();

            return $this->success('success', 'Account created successfully', [
                'top_deals' => $top_deals,
                'featured_products' => $featured_products->load('equipmentImages'),
                'recent_sales' => $recent_sales,
                'most_viewed_products' => $most_viewed_products,
            ], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function viewEquipment($product)
    {
        try {
            $product = Equipment::where('id', $product)->first();
            if ($product == null) {
                return $this->error('error', 'Product not found', null, 400);
            }

            $recent_sales = PlacedOrder::where('category', 'equipment')->skip(0)->take(6)->with(['equipment', 'equipment.equipmentImages'])->get();
            return $this->success('success', 'Account created successfully', [
                'product' => $product->load('equipmentImages'),
                'recent_sales' => $recent_sales,
            ], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function placeProductBid(array $data, $product)
    {
        try {
            $productExist = Equipment::where('id',$product)->first();
            if($productExist == null) {
                return $this->error('error', 'Product not found', null, 400);
            }

            $notification = new UserNotificationService();
            $bidded = ProductBid::where('equipment_id',$product)->first();
            if($bidded != null) {
                // dd('ss1');
                $bidded->amount = $data['amount'];
                $bidded->save();
                // dd('reach');
                $notified = $notification->notifyUser([
                    'user_id' => $productExist->seller_id,
                    'title' => 'New Bid for '.$bidded->equipment->name .'-'. $bidded->amount,
                    'description' => 'New Bid for '.$bidded->equipment->name.' - '.$bidded->amount.' has been placed by ' . auth()->user()->first_name . ' ' . auth()->user()->last_name
                ]);
                // dd($notified);
                return $this->success('success', 'New Product bid sent successfully', $bidded->load('equipment', 'seller', 'user'), 200);
            }

            $result  = ProductBid::create([
                'user_id' => auth()->user()->id,
                'seller_id' => $productExist->seller_id,
                'equipment_id' => $productExist->id,
                'amount' => $data['amount'],
                'status' => 'pending'
            ]);

            $notification = new UserNotificationService();
            $notified = $notification->notifyUser([
                'user_id' => $productExist->seller_id,
                'title' => 'Bid for ' . $bidded->equipment->name . '-' . $bidded->amount,
                'description' => 'Bid for ' . $bidded->equipment->name . ' - ' . $bidded->amount . ' has been placed by ' . auth()->user()->first_name . ' ' . auth()->user()->last_name
            ]);

            return $this->success('success', 'Product bid sent successfully', $result->load('equipment','seller','user'), 201);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }


    public function getBids()
    {
        try {
            $bids = ProductBid::all();
            return $this->success('success', 'Bids listed successfully', $bids->load('equipment'), 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
