<?php

namespace App\Services;

use App\Http\Requests\CartRequest;
use App\Models\CartItem;
use App\Models\SupportMessage;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;

class MessagingService
{
    use ApiResponse, SaveImage;

    public function sendMessage(array $data, $request)
    {
        try {
            $data['sender'] = auth()->user()->id;
            // $data['sent_to'] = $data;
            $equipment = SupportMessage::create($data);
            if ($request->hasFile('images')) {
                $imagedata = $this->saveImages($request->file()['images'], $equipment->id);
                $loadedImages = $equipment->equipmentImages()->createMany($imagedata);
            }
            return $this->success('success', 'Equipment added successfully', null, 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    private function saveImages(array $data, string $id)
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
}
