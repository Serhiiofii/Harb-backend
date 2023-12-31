<?php

namespace App\Services;

use App\Events\SendSellerOTP;
use App\Events\AnswerForQuote;
use App\Events\BidApprove;
use App\Http\Controllers\CartController;
use App\Models\CartItem;
use App\Models\Equipment;
use App\Models\ProductBid;
use App\Models\ProductQuote;
use App\Models\Seller;
use App\Models\SellerBusinessAccount;
use App\Models\SellerDocument;
use App\Models\Service;
use App\Models\User;
use App\Traits\ApiResponse;
use App\Traits\GenerateRandomString;
use App\Traits\SaveImage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class SellerService
{
    use ApiResponse, SaveImage, GenerateRandomString;

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
            if (auth()->user()->otp != $data['otp']) {
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

            $loadedImages = null;
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
            $accountExists = SellerBusinessAccount::where('account_number', $data['account_number'])->first();
            if ($accountExists) {
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

    public function getCompanies()
    {
        try {
            $total_companies = Seller::count();
            $companies = Seller::all();
            $verified_companies = Seller::where('verified', true)->count();
            $suspended_companies = Seller::where('suspended', true)->count();

            return $this->success('success', 'Successful', [
                'total_companies' => $total_companies,
                'verified_companies' => $verified_companies,
                'suspended_companies' => $suspended_companies,
                'companies' => $companies->load('user', 'businessDocuments')
            ], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function search($data)
    {
        try {
            $result = Seller::where('company_name', 'like', '%' . $data['search'] . '%')->get();
            return $this->success('success', 'Search successful', $result->load('user'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function toggleVerify($company)
    {
        try {
            $company = Seller::where('id', $company)->first();
            if (!$company) {
                return $this->error('error', 'Company does not exist', null, 400);
            }

            $company->verified = $company->verified ? false : true;
            $company->save();

            $notification = new UserNotificationService();
            $notified = $notification->notifyUser([
                'user_id' => $company->user_id,
                'title' => "Seller account has been approved",
                'description' => "Your seller account for $company->company_name has been approved."
            ]);

            $message = $company->verified ? 'Company marked as verified' : 'Company marked as unverified';
            return $this->success('success', $message, $company, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function delete($id)
    {
        try {
            $company = Seller::where('id', $id)->first();
            if (!$company) {
                return $this->error('error', 'Company not found', null, 400);
            }
            $company->delete();
            return $this->success('success', 'Company deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function productBidOffer(array $data, $product)
    {
        try {
            $productExist = Equipment::where('id', $product)->first();
            if ($productExist == null) {
                return $this->error('error', 'Product not found', null, 400);
            }
            // dd($productExist);

            $bid = ProductBid::where('equipment_id', $product)->orWhere('seller_id', auth()->user()->id)->first();
            if ($bid == null) {
                return $this->error('error', 'Unauthorized bid', null, 400);
            }
            // dd($bid);
            $bid->status = $data['offer'] == 'approve' ? 'approved' : 'declined';
            $bid->save();

            $cart_items = CartItem::where('equipment_id', $bid->equipment_id)->where('user_id', $bid->user_id)->first();
            if ($bid->status == 'approved') {
                if (!$cart_items) {
                    $cartService = new CartService();
                    $res = $cartService->addToCart([
                        'user_id' => $bid->user_id,
                        'equipment_id' => $bid->equipment_id,
                        'bid_amount' => $bid->amount,
                        'checkout_id' => $this->generateRandomString()
                    ]);
                } else {
                    $cart_items->bid_amount = $bid->amount;
                    $cart_items->save();
                }
                // CartItem::truncate();
            } else {
                if ($cart_items) {
                    $cart_items->delete();
                }
            }

            $notification = new UserNotificationService();
            $seller_firstname = $bid->seller->user->first_name;
            $notification->notifyUser([
                'user_id' => $bid->user_id,
                'title' => 'Bid for ' . $bid->equipment->name . ' ' . $bid->status,
                'description' => $seller_firstname.' '.$bid->status.' your bid for '.$bid->equipment->name
            ]);

            $emailData = [
                'buyer' => $bid->user,
                'seller' => $bid->seller,
                'product' => $bid->equipment,
                'bid' =>$bid
            ];
            event(new BidApprove($emailData));

            $message = $bid->status == 'approved' ? 'Bid approved' : 'Bid declined';
            return $this->success('success', $message, $bid->load('equipment', 'seller', 'user'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function removeProduct($item)
    {
        try {
            Equipment::where('id', $item)->first()->delete();
            return $this->success('success', 'Product deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function removeService($item)
    {
        try {
            $serviceExists = Service::where('id', $item)->first()->delete();
            return $this->success('success', 'Service deleted successfully', null, 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function productOrders($sellerId, $equipId)
    {
        try {
            $orders = ProductBid::where('seller_id', $sellerId)->where('equipment_id', $equipId)->orderBy('created_at', 'desc')->get();
            return $this->success('success', 'Getting Orders successfully', [
                'orders' => $orders->load('user'),
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function productQuotes($sellerId, $equipId){
        try {
            $quotes = ProductQuote::where('seller_id', $sellerId)->where('equipment_id', $equipId)->orderBy('created_at', 'desc')->get();
            return $this->success('success', 'Getting Quotes successfully', [
                'quotes' => $quotes->load('user'),
            ], 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
    
    public function productQuoteOffer(array $data, $quote) 
    {
        try {
            $quote = ProductQuote::where('id',$quote)->first();
            if($quote) {
                $quote->amount = $data['amount'];
                $quote->flag = 'answer';
                $quote->save();

                $product = Equipment::where('id', $quote->equipment_id)->first();
                $notification = new UserNotificationService();
                $notified = $notification->notifyUser([
                    'user_id' => $quote->user_id,
                    'title' => "Received a Quote - Product: " . $product->name,
                    'description' => "Received Quote You Asked Product(".$product->name.").",
                    'equipment_id' => $product->id,
                    'quote_id' => $quote->id,
                    'type' => 'quote'
                ]);

                
                $emailData = [
                    'buyer' => $quote->load('user'),
                    'product' => $product
                ];
                event(new AnswerForQuote($emailData));
                
                return $this->success('success', 'Quote Sent successfully', $quote, 200);
            } else {
                return $this->error('error', 'Quote doesn\'t exist', null, 400);    
            }
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
