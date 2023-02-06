<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Equipment;
use App\Models\EquipmentCustomSpecification;
use App\Models\EquipmentImage;
use App\Models\Payment;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Http;

class EquipmentService
{
    use ApiResponse, SaveImage;

    public function getAll()
    {
        try {
            $equipments = Equipment::all()->load('equipmentImages');
            $total = Equipment::count();
            $sold = Payment::where('category', 'equipment')->where('sale_type', 'sale')->count();
            $rented = Payment::where('category', 'equipment')->where('sale_type', 'rent')->count();
            return $this->success('success', 'Equipment listed successfully', [
                'equipments' => $equipments,
                'total_equipments' => $total,
                'sold_equipments' => $sold,
                'rented_equipments' => $rented,
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function deleteEquipment($id)
    {
        try {
            $files = EquipmentImage::where('equipment_id', $id)->get();
            $customSpecs = EquipmentCustomSpecification::where('equipment_id', $id)->get();
            if (count($customSpecs) > 0) {
                $ids = $customSpecs->pluck('id');
                EquipmentCustomSpecification::destroy($ids);
            }

            if ($files != null) {
                foreach ($files as $file) {
                    $img = 'images' . explode('images', $file->image)[1];
                    if (File::exists(public_path($img))) {
                        File::delete(public_path($img));
                    }
                }
                $imageIds = $files->pluck('id');
                EquipmentImage::destroy($imageIds);
            }

            Equipment::where('id', $id)->first()->delete();
            return $this->success('success', 'Equipment deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }


    public function addEquipment(array $data, $request)
    {
        try {
            $data['user_id'] = auth()->user()->id;
            $data['seller_id'] = auth()->user()->seller->id;
            $equipment = Equipment::create($data);
            $loadedImages = null;
            if ($request->hasFile('images')) {
                $imagedata = $this->saveImages($request->file()['images'], $equipment->id);
                $loadedImages = $equipment->equipmentImages()->createMany($imagedata);
            }

            $notification = new UserNotificationService();
            $notification->notifyUser([
                'user_id' => auth()->user()->id,
                'title' => 'Product was uploaded successfully',
                'description' => 'Product(' . $equipment->name . ')was uploaded successfully'
            ]);

            return $this->success('success', 'Equipment added successfully', ['equipment' => $equipment, 'equipment_images' => $loadedImages == null ? null : $loadedImages->load('equipment')], 201);
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
            // $tempArr['user_id'] = auth()->user()->id;
            $tempArr['image'] = $img;
            $imageArray[] = $tempArr;
        }
        return $imageArray;
    }

    public function searchEquipment($data)
    {
        try {
            $result = Equipment::where('name', 'like', '%' . $data['search'] . '%')->orWhere('manufacturer', 'like', '%' . $data['search'] . '%')->orWhere('description', 'like', '%' . $data['search'] . '%')->get();
            if ($result == null) {
                return $this->error('error', 'Result not found', null, 400);
            }

            return $this->success('success', 'Successful', $result->load('equipmentImages'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
