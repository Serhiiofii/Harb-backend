<?php

namespace App\Listeners;

use App\Events\BidApprove;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class BidApproveMail
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
     * @param  \App\Events\BidApprove  $event
     * @return void
     */
    public function handle(BidApprove $event)
    {
        $data = $event->data;
        Mail::send('emails.bid-approve', ['data' => $data], function ($message) use ($data) {
            $message->from(config('mail.from.address'));
            $message->subject($data['bid']->status . ' your bid for ' . $data['product']->name);
            $message->to($data['buyer']->email);
        });
    }
}
