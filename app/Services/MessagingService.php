<?php

namespace App\Services;

use App\Http\Requests\CartRequest;
use App\Models\CartItem;
use App\Models\SupportMessage;
use App\Models\SupportMessageImage;
use App\Traits\ApiResponse;
use App\Traits\GenerateRandomString;
use App\Traits\SaveImage;

class MessagingService
{
    use ApiResponse, SaveImage, GenerateRandomString;

    public function sendMessage(array $data, $request)
    {
        try {
            $data['sender'] = auth()->user()->id;
            // dd($data);
            // SupportMessage::truncate();
            // dd('ff');

            $prevMessage = SupportMessage::where('sender',$data['sent_to'])->orWhere('sent_to',$data['sent_to'])->first();
           
            if($prevMessage) {
                $data['messaging_id'] = $prevMessage->messaging_id;
            } else {
                $data['messaging_id'] = $this->generateRandomString();
            }
            
            $supportMessage = SupportMessage::create($data);
            $loadedImages = null;
            if ($request->hasFile('images')) {
                $imagedata = $this->saveImages($request->file()['images'], $supportMessage->id);
                $loadedImages = $supportMessage->supportImages()->createMany($imagedata);
            }
            return $this->success('success', 'Message sent successfully', $supportMessage->load('supportImages', 'sender', 'sentTo'), 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    protected function saveImages(array $data, string $id)
    {
        $imageArray = [];
        foreach ($data as $loadImage) {
            $tempArr = [];
            $img = $this->saveFile($loadImage);
            $tempArr['support_message_id'] = $id;
            $tempArr['image'] = $img;
            $imageArray[] = $tempArr;
        }
        return $imageArray;
    }

    public function userChat(string $messaging_id)
    {
        try {
            $chats = SupportMessage::where('messaging_id',$messaging_id)->get();
            // $messages = SupportMessage::where('sender',auth()->user()->id)-> orWhere('sent_to', auth()->user()->id)->get();
            return $this->success('success', 'Messages retrieved successfully', $chats->load('supportImages'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function chatListUsers()
    {
        try {
            $list = SupportMessage::where('sent_to',auth()->user()->id)->orWhere('sender',auth()->user()->id)->get();
            return $this->success('success', 'Chat list retrieved successfully', $list->load('supportImages', 'sender', 'sentTo'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
