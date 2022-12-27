<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\PaymentService;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    protected $paymentService;

    public function __construct(PaymentService $paymentService)
    {
        $this->paymentService = $paymentService;
    }

    public function getPaymentsDashboard()
    {
        return $this->paymentService->getPaymentsDashboard();
    }

    public function getPayment($id)
    {
        return $this->paymentService->viewPayment($id);
    }
}
