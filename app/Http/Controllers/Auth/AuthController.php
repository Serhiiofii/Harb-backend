<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Services\AuthService;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    protected $authService;

    public function __construct(AuthService $authService)
    {
        $this->authService = $authService;
    }

    public function register(RegisterRequest $request)
    {
        return $this->authService->createAccount($request->validated());
    }

    public function login(LoginRequest $request)
    {
        // dd($request->validated());
        return $this->authService->login($request->validated());
    }

    public function forgotPassword(Request $request)
    {
        $data = $request->validate([
            'email' => 'bail|required|email:rfc,dns'
        ]);
        return $this->authService->forgotPassword($data);
    }

    public function resetPassword(Request $request)
    {
        $data = $request->validate([
            'email' => 'bail|required|email:rfc,dns',
            'reset_code' => 'bail|required',
            'password' => 'bail|required',
        ]);
        
        return $this->authService->resetPassword($data);
    }


}
