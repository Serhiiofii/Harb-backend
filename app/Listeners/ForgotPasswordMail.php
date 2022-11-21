<?php

namespace App\Listeners;

use App\Events\ForgotPassword;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class ForgotPasswordMail
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
     * @param  \App\Events\ForgotPassword  $event
     * @return void
     */
    public function handle(ForgotPassword $event)
    {
        $user = $event->user;
        Mail::send('emails.forgot-password', ['user' => $user], function ($message) use ($user) {
            $message->from(config('mail.from.address'));
            $message->subject('Reset your password');
            $message->to($user->email);
        });
    }
}
