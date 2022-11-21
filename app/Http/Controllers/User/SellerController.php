<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\BecomeSellerRequest;
use App\Http\Requests\SellerAccountRequest;
use App\Services\SellerService;
use Illuminate\Http\Request;

class SellerController extends Controller
{
    protected $sellerService;

    public function __construct(SellerService $sellerService)
    {
        $this->sellerService = $sellerService;
    }

    public function getRegistrationCode(Request $request)
    {
        $data = $request->validate([
            'company_email' => 'bail|required|email|unique:sellers'
        ]);
        return $this->sellerService->requestRegistrationOTP($data);
    }

    public function becomeASeller(BecomeSellerRequest $request)
    {
        return $this->sellerService->becomeASeller($request);
    }

    public function setupAccountDetails(SellerAccountRequest $request)
    {
        return $this->sellerService->setupAccountDetails($request->validated());
    }

    
}
