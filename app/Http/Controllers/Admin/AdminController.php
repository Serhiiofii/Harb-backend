<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\CreateAdminRequest;
use App\Services\AdminService;
use Illuminate\Http\Request;

class AdminController extends Controller
{
    protected $adminService;

    public function __construct(AdminService $adminService)
    {
        $this->adminService = $adminService;
    }

    public function createAccount(CreateAdminRequest $request)
    {
        return $this->adminService->createAdmin($request->validated());
    }

    public function getAdmins()
    {
        return $this->adminService->getAdmins();
    }
}
