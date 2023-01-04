<?php

namespace App\Http\Controllers;

use App\Http\Requests\MessageRequest;
use App\Services\MessagingService;
use Illuminate\Http\Request;

class MessagingController extends Controller
{
    protected $messagingService;

    public function __construct(MessagingService $messagingService)
    {
        $this->messagingService = $messagingService;
    }

    public function sendMessage(MessageRequest $request)
    {
        return $this->messagingService->sendMessage($request->validated(), $request);
    }
}
