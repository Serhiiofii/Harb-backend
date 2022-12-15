<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class EquipmentService
{
    use ApiResponse, SaveImage;

    public function addEquipment(array $data, $request)
    {
        try {
            $data['user_id'] = auth()->user()->id;
            $data['seller_id'] = auth()->user()->id;
            $equipment = Equipment::create($data);
            if ($request->hasFile('images')) {
                $imagedata = $this->saveImages($request->file()['images'], $equipment->id);
                $loadedImages = $equipment->equipmentImages()->createMany($imagedata);
            }
            return $this->success('success', 'Equipment added successfully', ['equipment' => $equipment, 'equipment_images' => $loadedImages->load('equipment')], 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function addCustomSpecification(array $data)
    {
        try {
            $data['user_id'] = auth()->user()->id;
            $customSpecification = EquipmentCustomSpecification::create($data);
            return $this->success('success', 'Equipment added successfully', $customSpecification->load('equipment'), 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function saveImages(array $data, string $id)
    {
        $imageArray = [];
        foreach ($data as $loadImage) {
            $img = $this->saveFile($loadImage);
            $tempArr = [];
            $tempArr['equipment_id'] = $id;
            $tempArr['user_id'] = auth()->user()->id;
            $tempArr['image'] = $img;
            $imageArray[] = $tempArr;
        }
        return $imageArray;
    }
}
