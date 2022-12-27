<?php

use App\Http\Controllers\Admin\AccountController;
use App\Http\Controllers\Admin\EquipmentController;
use App\Http\Controllers\Admin\PaymentController;
use App\Http\Controllers\Admin\ServiceController;
use App\Http\Controllers\Auth\AuthController;
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
    });

    Route::middleware('auth:sanctum')->group(function () {
        Route::prefix('account')->controller(UserController::class)->group(function () {
            Route::get('profile', 'userProfile');
            Route::put('password', 'updatePassword');
            Route::put('personal-info', 'updateUserInfo');
            Route::put('delivery-address', 'updateDeliveryAddress');
            Route::put('bio', 'updateBio');
            Route::put('location', 'updateLocation');
            Route::post('update-photo', 'updateProfilePhoto');
        });

        Route::prefix('seller')->controller(SellerController::class)->group(function () {
            Route::post('request-otp', 'getRegistrationCode');
            Route::post('register', 'becomeASeller');
            Route::post('account-details', 'setupAccountDetails');
            Route::post('equipments/add', 'addEquipment');
            Route::post('services/add', 'addService');
            Route::post('equipments/custom-specification', 'addCustomSpecification');
        });


        Route::prefix('admin')->group(function () {
            Route::prefix('users')->controller(AccountController::class)->group(function(){
                Route::get('/', 'listUsers');
                Route::post('search', 'searchUser');
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
            Route::prefix('orders')->controller(ServiceController::class)->group(function () {
                Route::get('/', 'getAll');
                Route::post('search', 'search');
                Route::delete('/{id}', 'delete');
            });
        });
        // middleware('isAdmin')->
    });
    
});


