<?php

namespace App\Http\Requests\Equipment;

use Illuminate\Foundation\Http\FormRequest;

class AddRequest extends FormRequest
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
            'name' => 'bail|required|max:255',
            'description' => 'bail|required|max:255',
            'category' => 'bail|required',
            'manufacturer' => 'bail|required',
            'equipment_specification' => 'bail|required',
            'build_year' => 'bail|required',
            'sale_type' => 'bail|required',
            'images[]' => 'nullable|mimes:jpeg,jpg,png',
        ];
    }
}
