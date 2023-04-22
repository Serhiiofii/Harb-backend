<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Http\Requests\Auth\RegisterRequest;
use App\Services\AuthService;
use Illuminate\Http\Request;

use App\Models\User;
use GuzzleHttp\Exception\ClientException;
use Laravel\Socialite\Facades\Socialite;

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

    public function redirectToAuth()
    {
        return response()->json([
            'url' => Socialite::driver('google')
                         ->stateless()
                         ->redirect()
                         ->getTargetUrl(),
        ]);
    }

    public function handleAuthCallback()
    {
        print_r("asdfasdfasdf");
        return response()->json([
            'url' => "asdfasdfasfdasdf",
        ]);
        // try {
        //     $googleUser = Socialite::driver('google')->stateless()->user();
        // } catch (ClientException $e) {
        //     return response()->json(['error' => 'Invalid credentials provided.'], 422);
        // }

        // $user = User::firstOrCreate(
        //         [
        //             'email' => $googleUser->getEmail(),
        //         ],
        //         [
        //             'email_verified_at' => now(),
        //             'name' => $googleUser->getName(),
        //             'google_id' => $googleUser->getId(),
        //             'avatar' => $googleUser->getAvatar(),
        //         ]
        //     );

        // return response()->json([
        //     'user' => $user,
        //     // 'access_token' => $user->createToken('google-token')->plainTextToken,
        //     'token_type' => 'Bearer',
        // ]);
    }

}
