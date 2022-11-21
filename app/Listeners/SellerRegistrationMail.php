<?php

namespace App\Listeners;

use App\Events\SendSellerOTP;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class SellerRegistrationMail
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\SendSellerOTP  $event
     * @return void
     */
    public function handle(SendSellerOTP $event)
    {
        $userdata = $event->userdata;
        Mail::send('emails.seller-reg-otp', ['data' => $userdata], function ($message) use ($userdata) {
            $message->from(config('mail.from.address'));
            $message->subject('Complete Seller Registration');
            $message->to($userdata['company_email']);
        });
    }
}
