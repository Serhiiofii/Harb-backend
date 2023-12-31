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
use App\Models\CartItem;
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
            $cart_items = CartItem::where('equipment_id', $id)->count();
            if($cart_items){
                return $this->success('error', 'Can\'t delete this product. Offer(s) of this product is processing', null, 400);
            }
            $customSpecs = EquipmentCustomSpecification::where('equipment_id', $id)->get();
            if (count($customSpecs) > 0) {
                $ids = $customSpecs->pluck('id');
                EquipmentCustomSpecification::destroy($ids);
            }
            
            $files = EquipmentImage::where('equipment_id', $id)->get();
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

            // $notification = new UserNotificationService();
            // $notification->notifyUser([
            //     'user_id' => auth()->user()->id,
            //     'title' => 'Product was uploaded successfully',
            //     'description' => 'Product(' . $equipment->name . ')was uploaded successfully'
            // ]);

            return $this->success('success', 'Equipment added successfully', ['equipment' => $equipment, 'equipment_images' => $loadedImages == null ? null : $loadedImages->load('equipment')], 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function saveEquipment(array $data, $request)
    {
        try {
            $equipment = Equipment::where('id', $data['id'])->first();
            $equipment->name = $data['name'];
            $equipment->description = $data['description'];
            $equipment->category = $data['category'];
            $equipment->manufacturer = $data['manufacturer'];
            $equipment->equipment_specification = $data['equipment_specification'];
            $equipment->sale_type = $data['sale_type'];
            $equipment->user_id = auth()->user()->id;
            $equipment->seller_id = auth()->user()->seller->id;
            $equipment->save();

            $loadedImages = null;
            if ($request->hasFile('images')) {
                $files = EquipmentImage::where('equipment_id', $equipment->id)->get();
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
                $imagedata = $this->saveImages($request->file()['images'], $equipment->id);
                $loadedImages = $equipment->equipmentImages()->createMany($imagedata);
            }

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

    public function getCategoriesFromEquipment()
    {
        try {
            $categories = Equipment::pluck('category')->unique();
            $catArr = [];
            foreach ($categories as $key => $value) {
                $tempArr = [];
                $slug = preg_replace('#[ -]+#', '-', trim($value));
                $tempArr['category_name'] = $value;
                $tempArr['category_slug'] = $slug;
                $tempArr['number_of_equipments'] = Equipment::where('category',$value)->count();
                array_push($catArr, $tempArr);
            }
            
            return $this->success('success', 'Categories generated successfully', $catArr, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getEquipmentByCategory($slug)
    {
        try {
            $equipments = Equipment::where('category', $slug)->paginate(20);
            return $this->success('success', 'Successful', $equipments->load('equipmentImages'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }

    }
}
