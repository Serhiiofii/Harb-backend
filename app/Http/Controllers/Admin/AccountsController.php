<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Services\AccountService;
use Illuminate\Http\Request;

class AccountsController extends Controller
{
    protected $accountService;

    public function __construct(AccountService $accountService)
    {
        $this->accountService = $accountService;
    }

    public function listUsers()
    {
        return $this->accountService->listUsers();
    }

    public function viewUser($id)
    {
        return $this->accountService->viewUser($id);
    }

    public function searchUser(Request $request)
    {
        $data = $request->validate([
            'search' => 'bail|required'
        ]);
        return $this->accountService->searchUser($data);
    }

    public function deleteUser($id)
    {
        return $this->accountService->deleteAccount($id);
    }
}
