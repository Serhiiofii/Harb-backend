<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminRoleRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        // return auth()->user()->user_role == 'superadmin';
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
            'payments' => 'bail|required|integer',
            'orders' => 'bail|required|integer',
            'products' => 'bail|required|integer',
            'services' => 'bail|required|integer',
        ];
    }
}
