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

    public function userChat(Request $request)
    {
        $data = $request->validate([
            'messaging_id' => 'bail|required|string'
        ]);
        return $this->messagingService->userChat($data['messaging_id']);
    }

    public function chatListUsers()
    {
        return $this->messagingService->chatListUsers();
    }

    // public function getChats(Request $request)
    // {
    //     $data = $request->validate([
    //         'message_id' => 'bail|required',
    //         'sent_to' => 'bail|required',
    //         'sender' => 'bail|required',
    //     ]);
    //     return $this->messagingService->getChats($data);
    // }
}
