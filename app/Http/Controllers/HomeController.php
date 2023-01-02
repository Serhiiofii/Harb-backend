<?php

namespace App\Http\Controllers;

use App\Models\Equipment;
use App\Services\HomeService;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    protected $homeService;

    public function __construct(HomeService $homeService)
    {
        $this->homeService = $homeService;
    }

    public function getDashboardData()
    {
        return $this->homeService->getDashboardData();
    }

    public function viewProduct($product)
    {
        return $this->homeService->viewEquipment($product);
    }

    public function placeProductBid(Request $request, $product)
    {
        $data = $request->validate([
            'amount' => 'bail|required'
        ]);
        return $this->homeService->placeProductBid($data, $product);
    }

    public function getBids()
    {
        return $this->homeService->getBids();
    }


    
}
