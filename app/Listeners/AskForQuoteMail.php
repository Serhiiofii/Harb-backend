<?php

namespace App\Listeners;

use App\Events\AskForQuote;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class AskForQuoteMail
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
     * @param  \App\Events\AskForQuote  $event
     * @return void
     */
    public function handle(AskForQuote $event)
    {
        $data = $event->data;
        Mail::send('emails.ask-for-quote', ['data' => $data], function ($message) use ($data) {
            $message->from(config('mail.from.address'));
            $message->subject('Asking For Quote for product - ');
            $message->to($data['company_email']);
        });
    }
}
