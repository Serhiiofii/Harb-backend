<?php

namespace App\Listeners;

use App\Events\EmailVerify;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class EmailVerifymail
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
     * @param  \App\Events\EmailVerify  $event
     * @return void
     */
    public function handle(EmailVerify $event)
    {
        $userdata = $event->userdata;
        Mail::send('emails.email-verify-code', ['data' => $userdata], function ($message) use ($userdata) {
            $message->from(config('mail.from.address'));
            $message->subject('Your email verification code');
            $message->to($userdata['email']);
        });
    }
}
