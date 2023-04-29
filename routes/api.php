<?php

use App\Http\Controllers\Admin\AccountController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\CompanyController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\EquipmentController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\PaymentController;
use App\Http\Controllers\Admin\ServiceController;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MessagingController;
use App\Http\Controllers\User\SellerController;
use App\Http\Controllers\User\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::prefix('v1')->group(function(){
    Route::prefix('auth')->controller(AuthController::class)->group(function () {
        Route::post('register', 'register');
        Route::post('login', 'login');
        Route::post('forgot-password', 'forgotPassword');
        Route::post('reset-password', 'resetPassword');
        Route::post('change-email', 'changeEmail');
        Route::post('verify-email', 'verifyEmail');

        Route::get('google', 'googelRedirectToAuth');
        Route::get('callback', 'googleAuthCallback');
    });

    Route::get('products/get-products', [HomeController::class, 'getDashboardData']);
    Route::post('equipments/search', [EquipmentController::class, 'searchEquipment']);
    Route::get('categories', [EquipmentController::class, 'getCategoriesFromEquipment']);
    Route::get('equipment/categories/{slug}', [EquipmentController::class, 'getEquipmentByCategory']);

    // Route::get('products/get-products', [EquipmentController::class, 'getAll']);
    
    Route::middleware('auth:sanctum')->group(function () {
        Route::controller(HomeController::class)->group(function () {
            Route::get('bid-notifications', 'getBids');
            Route::get('products/{product}', 'viewProduct');
            Route::post('products/{product}/bid', 'placeProductBid');
            Route::post('products/ask', 'askForQuate');
        });

        Route::prefix('account')->controller(UserController::class)->group(function () {
            Route::get('profile', 'userProfile');
            Route::put('password', 'updatePassword');
            Route::put('personal-info', 'updateUserInfo');
            Route::put('delivery-address', 'updateDeliveryAddress');
            Route::put('bio', 'updateBio');
            Route::put('location', 'updateLocation');
            Route::post('update-photo', 'updateProfilePhoto');
            Route::get('cart-items', 'getCartItems');
            Route::delete('cart-items/{id}', 'cancelCartItem');
            Route::get('saved-items', 'getSavedItems');
            Route::get('notifications', 'getNotifications');
            Route::get('notifications/{id}', 'getNotification');
            Route::post('saved-items/{id}', 'saveItem');
            Route::get('services/{id}', 'getService');
            Route::get('sellers/{id}', 'getSeller');
        });

        Route::prefix('messaging')->controller(MessagingController::class)->group(function() {
            Route::post('send-message', 'sendMessage');
            Route::post('chat-messages', 'userChat');
            Route::get('chat-list', 'chatListUsers');
        });

        Route::prefix('transactions')->controller(PaymentController::class)->group(function () {
            Route::post('verify', 'verifyTransaction');
        });

        // 
        Route::prefix('seller')->group(function () {
            Route::controller(SellerController::class)->group(function(){
                Route::post('request-otp', 'getRegistrationCode');
                Route::post('register', 'becomeASeller');
            });
            Route::controller(SellerController::class)->middleware('isSeller')->group(function(){
                Route::post('account-details', 'setupAccountDetails');
                Route::post('equipments/add', 'addEquipment');
                Route::post('services/add', 'addService');
                Route::post('equipments/custom-specification', 'addCustomSpecification');
                Route::put('products/{product}/bid-offer', 'productBidOffer');
                Route::get('orders/{sellerId}/{equipId}', 'productOrders');
                Route::post('products/quote/{quote}', 'productQuoteOffer');
            });
            Route::delete('/equipments/{id}', [EquipmentController::class, 'deleteEquipment']);
            Route::delete('/services/{id}', [ServiceController::class, 'delete']);
        });


    // 
        Route::prefix('admin')->middleware('isAdmin')->group(function () {
            Route::prefix('dashboard')->controller(DashboardController::class)->group(function () {
                Route::get('/get-data', 'dashboardData');
            });
            Route::controller(AdminController::class)->group(function () {
                Route::get('/get-admins', 'getAdmins');
                Route::post('/create-admin', 'createAccount');
                Route::put('/{user}/roles', 'changeAdminPermission');
            });
            Route::prefix('users')->controller(AccountController::class)->group(function(){
                Route::get('/', 'listUsers');
                Route::post('/search', 'searchUser');
                Route::get('/{id}', 'viewUser');
                Route::delete('/{id}', 'deleteUser');
            });
            Route::prefix('payments')->controller(PaymentController::class)->group(function () {
                Route::get('/', 'getPaymentsDashboard');
            });
            Route::prefix('equipments')->controller(EquipmentController::class)->group(function () {
                Route::get('/', 'getAll');
                Route::post('search', 'searchEquipment');
                Route::delete('/{id}', 'deleteEquipment');
            });
            Route::prefix('services')->controller(ServiceController::class)->group(function () {
                Route::get('/', 'getAll');
                Route::post('search', 'search');
                Route::delete('/{id}', 'delete');
            });
            Route::prefix('orders')->controller(OrderController::class)->group(function () {
                Route::get('/', 'getAll');
                Route::post('search', 'search');
                Route::delete('/{id}', 'delete');
            });
            Route::prefix('companies')->controller(CompanyController::class)->group(function () {
                Route::get('/', 'getAll');
                Route::post('search', 'search');
                Route::put('/{company}', 'toggleVerify');
                Route::delete('/{id}', 'delete');
            });
        });


        // middleware('isAdmin')->
    });
    
});


