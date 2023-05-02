<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\BecomeSellerRequest;
use App\Http\Requests\Equipment\AddRequest;
use App\Http\Requests\Equipment\CustomSpecRequest;
use App\Http\Requests\SellerAccountRequest;
use App\Http\Requests\Services\AddServiceRequest;
use App\Services\EquipmentService;
use App\Services\SellerService;
use App\Services\SellerServiceService;
use Illuminate\Http\Request;

class SellerController extends Controller
{
    protected $sellerService;
    protected $equipmentService;
    protected $serviceService;

    public function __construct(SellerService $sellerService, EquipmentService $equipmentService, SellerServiceService $serviceService)
    {
        $this->sellerService = $sellerService;
        $this->equipmentService = $equipmentService;
        $this->serviceService = $serviceService;
    }

    public function getRegistrationCode(Request $request)
    {
        $data = $request->validate([
            'company_email' => 'bail|required'
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

    public function addEquipment(AddRequest $request)
    {
        return $this->equipmentService->addEquipment($request->validated(), $request);
    }

    public function saveEquipment(Request $request)
    {
        $data = $request->validate([
            'id' => 'bail|required',
            'name' => 'bail|required|max:255',
            'description' => 'bail|required|max:255',
            'category' => 'bail|required',
            'manufacturer' => 'bail|required',
            'equipment_specification' => 'bail|required',
            'sale_type' => 'bail|required',
            'images[]' => 'nullable|mimes:jpeg,jpg,png',
        ]);
        return $this->equipmentService->saveEquipment($data, $request);
    }

    public function addCustomSpecification(CustomSpecRequest $request)
    {
        return $this->equipmentService->addCustomSpecification($request->validated());
    }

    public function addService(AddServiceRequest $request)
    {
        return $this->serviceService->addService($request->validated());
    }

    public function productBidOffer(Request $request, $product)
    {
        $data = $request->validate([
            'offer' => 'bail|required'
        ]);
        return $this->sellerService->productBidOffer($data, $product);
    }

    public function removeProduct($item)
    {
        return $this->sellerService->removeProduct($item);
    }

    public function removeService($item)
    {
        return $this->sellerService->removeService($item);
    }

    public function productOrders($sellerId, $equipId)
    {
        return $this->sellerService->productOrders($sellerId, $equipId);
    }

    public function productQuoteOffer(Request $request, $quote)
    {
        $data = $request->validate([
            'amount' => 'bail|required'
        ]);
        return $this->sellerService->productQuoteOffer($data, $quote);
    }
    
    



    
}
