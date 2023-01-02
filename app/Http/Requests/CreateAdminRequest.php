<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateAdminRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return auth()->user()->user_role != 'admin';
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'first_name' => 'bail|required|max:255',
            'last_name' => 'bail|required|max:255',
            'email' => 'bail|required|max:255|unique:users|email',
            'password' => 'bail|required',
            'phone' => 'bail|required|unique:users',
        ];
    }
}
