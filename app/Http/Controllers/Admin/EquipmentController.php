<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\EquipmentService;
use Illuminate\Http\Request;

class EquipmentController extends Controller
{
    protected $equipmentService;

    public function __construct(EquipmentService $equipmentService)
    {
        $this->equipmentService = $equipmentService;
    }

    public function getAll()
    {
        return $this->equipmentService->getAll();
    }

    public function deleteEquipment($id)
    {
        return $this->equipmentService->deleteEquipment($id);
    }

    public function searchEquipment(Request $request)
    {
        $data = $request->validate([
            'search' => 'bail|required'
        ]);
        return $this->equipmentService->searchEquipment($data);
    }

    public function getCategoriesFromEquipment()
    {
        return $this->equipmentService->getCategoriesFromEquipment();
    }
}
