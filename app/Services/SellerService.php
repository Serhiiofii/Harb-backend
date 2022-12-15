<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Models\Seller;
use App\Models\SellerBusinessAccount;
use App\Models\SellerDocument;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\Http;

class SellerService
{
    use ApiResponse, SaveImage;

    private $sellerDocumentService;

    public function __construct(SellerDocumentService $sellerDocumentService)
    {
        $this->sellerDocumentService = $sellerDocumentService;
    }

    public function requestRegistrationOTP(array $data)
    {
        try {
            $user = User::where('id', auth()->user()->id)->first();
            $user->otp = random_int(100000, 999999);
            $user->save();

            $userdata = [
                'otp' => $user->otp,
                'first_name' => $user->first_name,
                'company_email' => $data['company_email']
            ];

            event(new SendSellerOTP($userdata));
            return $this->success('success', 'An OTP has been sent to ' . $data['company_email'], $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function becomeASeller($request)
    {
        try {
            $data = $request->validated();
            if(auth()->user()->otp != $data['otp']) {
                return $this->error('error', 'Invalid OTP code', null, 400);
            }

            $seller = Seller::create([
                'company_name' => $data['company_name'],
                'user_id' => auth()->user()->id,
                'company_email' => $data['company_email'],
                'business_entity' => $data['business_entity'],
                'company_role' => $data['company_role'],
                'business_location' => $data['business_location'],
                'business_description' => $data['business_description'],
            ]);

            if ($request->hasFile('business_documents')) {
                $imagedata = $this->sellerDocumentService->saveImages($request->file()['business_documents'], $seller->id, auth()->user()->id);
                $loadedImages = $seller->businessDocuments()->createMany($imagedata);
            }

            auth()->user()->update(['otp' => null, 'user_role' => 'seller']);
            return $this->success('success', 'Seller account created successfully', ['seller' => $seller, 'seller_documents' => $loadedImages], 201);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function setupAccountDetails(array $data)
    {
        try {
            $accountExists = SellerBusinessAccount::where('account_number',$data['account_number'])->first();
            if($accountExists) {
                return $this->error('error', 'Account details already exists', null, 400);
            }

            $accountDetails = SellerBusinessAccount::create([
                'seller_id' => $data['seller_id'],
                'user_id' => auth()->user()->id,
                'account_name' => $data['account_name'],
                'account_number' => $data['account_number'],
                'bank_name' => $data['bank_name'],
                'company_position' => $data['company_position'],
                'account_officer' => $data['account_officer'],
                'account_officer_phone' => $data['account_officer_phone'],
            ]);
            
            return $this->success('success', 'Seller account details added successfully', $accountDetails, 201);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    

}
