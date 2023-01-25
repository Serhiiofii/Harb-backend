<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\OrderService;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    protected $orderService;

    public function __construct(OrderService $orderService)
    {
        $this->orderService = $orderService;
    }

    public function getAll()
    {
        return $this->orderService->getAll();
    }

    public function search(Request $request)
    {
        $data = $request->validate([
            'search' => 'bail|required'
        ]);
        return $this->orderService->search($data);
    }
}
