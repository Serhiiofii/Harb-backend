<?php

namespace App\Listeners;

use App\Events\AnswerForQuote;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class AnswerForQuoteMail
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
     * @param  \App\Events\AnswerForQuote  $event
     * @return void
     */
    public function handle(AnswerForQuote $event)
    {
        $data = $event->data;
        Mail::send('emails.answer-for-quote', ['data' => $data], function ($message) use ($data) {
            $message->from(config('mail.from.address'));
            $message->subject('Received a Quote - Product: ' . $data['product']->name);
            $message->to($data['buyer']['user']->email);
        });
    }
}
