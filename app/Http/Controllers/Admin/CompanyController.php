<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\SellerService;
use Illuminate\Http\Request;

class CompanyController extends Controller
{
    protected $companyService;

    public function __construct(SellerService $companyService)
    {
        $this->companyService = $companyService;
    }

    public function getAll()
    {
        return $this->companyService->getCompanies();
    }

    public function search(Request $request)
    {
        $data = $request->validate([
            'search' => 'bail|required'
        ]);
        return $this->companyService->search($data);
    }

    public function toggleVerify($company)
    {
        return $this->companyService->toggleVerify($company);
    }

    public function delete($id)
    {
        return $this->companyService->delete($id);
    }
    
}
