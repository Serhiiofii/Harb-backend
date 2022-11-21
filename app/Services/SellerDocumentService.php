<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Seller;
use App\Models\SellerDocument;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class SellerDocumentService
{
    use ApiResponse, SaveImage;

    public function saveImages(array $data, string $sellerId)
    {
        $imageArray = [];
        foreach ($data as $docImage) {
            $img = $this->saveFile($docImage);
            $tempArr = [];
            $tempArr['seller_id'] = $sellerId;
            $tempArr['document'] = $img;
            $imageArray[] = $tempArr;
        }
        return $imageArray;
    }
}
