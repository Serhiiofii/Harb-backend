<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class BecomeSellerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
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
            'company_name' => 'bail|required',
            'company_email' => 'bail|required',
            'otp' => 'bail|required',
            'business_entity' => 'bail|required',
            'company_role' => 'bail|required',
            'business_documents[]' => 'nullable|mimes:jpg,png,jpeg|max:9086',
            'business_location' => 'bail|required',
            'business_description' => 'bail|nullable',
        ];
    }
}
