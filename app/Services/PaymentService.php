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
    //     try {
    //         $result = Payment::where('first_name', 'like', '%' . $data['search'] . '%')->orWhere('last_name', 'like', '%' . $data['search'] . '%')->orWhere('email', 'like', '%' . $data['search'] . '%')->get();
    //         if ($result == null) {
    //             return $this->error('error', 'Account not found', null, 400);
    //         }

    //         return $this->success('success', 'Search successful', $result, 200);
    //     } catch (\Throwable $e) {
    //         return $this->error('error', $e->getMessage(), null, 500);
    //     }
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
}