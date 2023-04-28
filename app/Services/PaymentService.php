<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\CartItem;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Payment;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\Service;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\GenerateRandomString;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class PaymentService
{
    use ApiResponse, SaveImage, GenerateRandomString;

    public function getPaymentsDashboard()
    {
        try {
            $payments = Payment::all();
            $total_payments = Payment::sum('amount');
            $received_payments = Payment::sum('amount');
            $sent_payments = Payment::sum('amount');
            $pending_payments = Payment::sum('amount');

            return $this->success('success', 'Payments retrieved successfully', [
                'payments' => $payments,
                'total_payments' => $total_payments,
                'received_payments' =>  $received_payments,
                'sent_payments' => $sent_payments,
                'pending_payments' => $pending_payments
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    // public function search($data)
    // {
        // try {
        //     $result = Payment::where('first_name', 'like', '%' . $data['search'] . '%')->orWhere('last_name', 'like', '%' . $data['search'] . '%')->orWhere('email', 'like', '%' . $data['search'] . '%')->get();
        //     if ($result == null) {
        //         return $this->error('error', 'Account not found', null, 400);
        //     }

        //     return $this->success('success', 'Search successful', $result, 200);
        // } catch (\Throwable $e) {
        //     return $this->error('error', $e->getMessage(), null, 500);
        // }
    // }

    public function viewPayment($id)
    {
        try {
            $payment = Payment::where('id', $id)->first();
            if ($payment == null) {
                return $this->error('error', 'Payment record not found', null, 400);
            }
            
            return $this->success('success', 'Payment details retrieved successfully', $payment, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function verifyTransaction(array $data)
    {
        try {
            $cartItems = CartItem::where('checkout_id', $data['cart_reference_id'])->get();
            if($cartItems->count() < 1) {
                return $this->error('error', 'Invalid cart checkout id', null, 400);
            }
            
            $duplicatePayment = Payment::where('reference',$data['paystack_reference_id'])->first();
            if($duplicatePayment) {
                return $this->error('error', 'Duplicate transaction error', null, 400);
            }

            $response = Http::withHeaders([
                'Authorization' => 'Bearer ' . config('app.paystack.secret_key')
            ])->get('https://api.paystack.co/transaction/verify/' . $data['paystack_reference_id']);

            $apiResp = json_decode($response->body());
            if($apiResp->status == false) {
                return $this->error('error',$apiResp->message,null,400);
            }

            $paymentDataArr = [];
            foreach ($cartItems as $key => $value) {
                $tempArr = [];
                $tempArr['reference'] = $data['paystack_reference_id'];
                $tempArr['user_id'] = $cartItems[$key]['user_id'];
                $tempArr['equipment_id'] = $cartItems[$key]['equipment_id'];
                $tempArr['checkout_id'] = $cartItems[$key]['checkout_id'];
                $tempArr['amount'] = $cartItems[$key]['bid_amount'];
                $tempArr['category'] = 'equipment';
                $tempArr['sale_type'] = $cartItems[$key]->equipment->sale_type;
                \array_push($paymentDataArr, $tempArr);
            }

            $record = auth()->user()->payments()->createMany($paymentDataArr);
            return $this->success('success', 'Payment successful', $record, 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    
}