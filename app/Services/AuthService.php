<?php

namespace App\Services;

use App\Events\ForgotPassword;
use App\Events\EmailVerify;
use App\Models\User;
use App\Traits\ApiResponse;
use Carbon\Carbon;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;

class AuthService
{
    use ApiResponse;

    public function createAccount(array $data)
    {
        try {
            $user = User::create($data);
            return $this->success('success', 'Account created successfully', $user, 201);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function login(array $data)
    {
        try {
            $user = User::where('email', $data['email'])->first();
            if (!$user || !Hash::check($data['password'], $user->password)) {
                return $this->error('error', 'Incorrect email/password', null, 400);
            }

            if($user && $user->email_verified_at==null) {
                return $this->error('error', 'Your email hasn\'t been verified', null, 400);
            }

            $token = $user->createToken($data['email'])->plainTextToken;
            $user->last_login = now();
            $user->save();

            return $this->success('success', 'Login successful', ['token' => $token, 'user' => $user], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function forgotPassword(array $data)
    {
        try {
            $user = User::where('email', $data['email'])->first();
            if($user == null) {
                return $this->error('error', 'Account does not exist', null, 400);
            }
            $user->otp = random_int(100000, 999999);
            $user->save();

            event(new ForgotPassword($user));
            return $this->success('success', 'A reset code has been sent to '. $data['email'], $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function resetPassword(array $data)
    {
        try {
            $user = User::where('email', $data['email'])->first();
            if ($user == null) {
                return $this->error('error', 'Account does not exist', null, 400);
            }
            if ($user->otp == null) {
                return $this->error('error', 'Invalid reset code', null, 400);
            }

            $user->otp = null;
            $user->password = $data['password'];
            $user->save();
            $user->tokens()->delete();
            return $this->success('success', 'Password reset successful', $user, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function changeEmail(array $data)
    {
        try {
            $user = User::where('email', $data['oldEmail'])->first();
            $user->email = $data['email'];
            $user->otp = random_int(100000, 999999);
            $user->save();

            event(new EmailVerify($user));
            return $this->success('success', 'Email verify code has been sent to '. $data['email'], null, 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
    
    public function verifyEmail(array $data)
    {
        try {
            $user = User::where('email', $data['email'])->first();
            
            if($user && $user->otp!=$data['verifyCode']) {
                return $this->error('error', 'Your email verify code is Wrong', null, 400);
            }

            $token = $user->createToken($data['email'])->plainTextToken;
            $user->last_login = now();
            $user->email_verified_at = now();
            $user->save();
            
            event(new EmailVerify($user));
            return $this->success('success', 'Email verify was done successfully', ['token' => $token, 'user' => $user], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function googleAuth($googleUser)
    {
        try {
            list($firstname, $lastname) = explode(" ", $googleUser->getName());
        
            $user = User::firstOrCreate(
                    [
                        'email' => $googleUser->getEmail(),
                    ],
                    [
                        'email_verified_at' => now(),
                        'first_name' => $firstname,
                        'last_name' => $lastname,
                        'google_id' => $googleUser->getId(),
                        'avatar' => $googleUser->getAvatar(),
                    ]
                );

            $access_token = $user->createToken('google-token')->plainTextToken;
            return $this->success('success', 'Login successful', ['token' => $access_token, 'user' => $user], 200);
        } catch (\Exception $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
