<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Http\Requests\UpdatePassword;
use App\Http\Requests\UserInfoRequest;
use App\Services\UserService;
use Illuminate\Http\Request;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function userProfile()
    {
        return $this->userService->getProfile();
    }

    public function updatePassword(UpdatePassword $request)
    {
        return $this->userService->updatePassword($request->validated());
    }

    public function updateUserInfo(UserInfoRequest $request)
    {
        return $this->userService->updateUserInfo($request->validated());
    }

    public function updateDeliveryAddress(Request $request)
    {
        $data = $request->validate([
            'delivery_address' => 'bail|required'
        ]);
        return $this->userService->updateDeliveryAddress($data);
    }

    public function updateBio(Request $request)
    {
        $data = $request->validate([
            'bio' => 'bail|required'
        ]);
        return $this->userService->updateBio($data);
    }

    public function updateLocation(Request $request)
    {
        $data = $request->validate([
            'location' => 'bail|required'
        ]);
        return $this->userService->updateLocation($data);
    }

    public function updateProfilePhoto(Request $request)
    {
        $data = $request->validate([
            'photo' => 'bail|required|mimes:jpeg,png,jpg|max:2048',
        ]);
        return $this->userService->uploadPhoto($data);
    }

    public function getNotifications()
    {
        return $this->userService->getNotifications();
    }

    public function getNotification($id)
    {
        return $this->userService->getNotification($id);
    }

    public function getCartItems()
    {
        return $this->userService->getCartItems();
    }

    public function saveItem($id)
    {
        return $this->userService->saveItem($id);
    }

    public function getSavedItems()
    {
        return $this->userService->getSavedItems();
    }

    public function getService($id)
    {
        return $this->userService->getService($id);
    }

    public function getSeller($id)
    {
        return $this->userService->getSeller($id);
    }


    
    

    
}
