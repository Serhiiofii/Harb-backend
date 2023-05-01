<?php

namespace App\Listeners;

use App\Events\MakeBid;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class MakeBidMail
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
     * @param  \App\Events\MakeBid  $event
     * @return void
     */
    public function handle(MakeBid $event)
    {
        $data = $event->data;
        Mail::send('emails.make-bid', ['data' => $data], function ($message) use ($data) {
            $message->from(config('mail.from.address'));
            $message->subject('Bid for '.$data->equipment->name .'-'. $data->amount);
            $message->to($data->seller->company_email);
        });
    }
}
