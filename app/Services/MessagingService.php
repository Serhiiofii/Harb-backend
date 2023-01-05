<?php

namespace App\Services;

use App\Http\Requests\CartRequest;
use App\Models\CartItem;
use App\Models\SupportMessage;
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
            $prevMessage = SupportMessage::where('messaging_id',$data['messaging_id'])->first();
            if($prevMessage) {
                $data['messaging_id'] = $prevMessage->messaging_id;
            }
            $data['messaging_id'] = $this->generateRandomString();
            $supportMessage = SupportMessage::create($data);
            if ($request->hasFile('images')) {
                $imagedata = $this->saveImages($request->file()['images'], $supportMessage->id);
                $loadedImages = $supportMessage->supportImages()->createMany($imagedata);
            }
            return $this->success('success', 'Message sent successfully', $supportMessage->load('supportImages', 'sender', 'sentTo'), 201);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    private function saveImages(array $data, string $id)
    {
        $imageArray = [];
        foreach ($data as $loadImage) {
            $img = $this->saveFile($loadImage);
            $tempArr = [];
            $tempArr['support_message_id'] = $id;
            $tempArr['image'] = $img;
            $imageArray[] = $tempArr;
        }
        return $imageArray;
    }

    public function chatMessagesList()
    {
        try {
            $messages = SupportMessage::where('sender',auth()->user()->id)-> orWhere('sent_to', auth()->user()->id)->get();
            return $this->success('success', 'Messages retrieved successfully', $messages->load('sentTo'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }

    public function getChats(array $data)
    {
        try {
            $list = SupportMessage::where('id', $data['message_id'])->where(function($query) use ($data) {
                $query->where('sent_to',$data['sent_to'])->orWhere('sender',$data['sender']);
            })->get();
            return $this->success('success', 'Chat list retrieved successfully', $list->load('supportImages', 'sender', 'sentTo'), 200);
        } catch (\Throwable $e) {
            return $this->error('error', $e->getMessage(), null, 500);
        }
    }
}
