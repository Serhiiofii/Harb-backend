<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\SellerServiceService;
use Illuminate\Http\Request;

class ServiceController extends Controller
{
    protected $serviceService;

    public function __construct(SellerServiceService $serviceService)
    {
        $this->serviceService = $serviceService;
    }

    public function getAll()
    {
        return $this->serviceService->getAll();
    }

    public function delete($id)
    {
        return $this->serviceService->delete($id);
    }

    public function search(Request $request)
    {
        $data = $request->validate([
            'search' => 'bail|required'
        ]);
        return $this->serviceService->search($data);
    }
}
