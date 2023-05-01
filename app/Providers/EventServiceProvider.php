<?php

namespace App\Providers;

use App\Events\ForgotPassword;
use App\Events\SendSellerOTP;
use App\Events\EmailVerify;
use App\Events\AskForQuote;
use App\Events\AnswerForQuote;
use App\Events\MakeBid;
use App\Listeners\ForgotPasswordMail;
use App\Listeners\SellerRegistrationMail;
use App\Listeners\EmailVerifymail;
use App\Listeners\AskForQuoteMail;
use App\Listeners\AnswerForQuoteMail;
use App\Listeners\MakeBidMail;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        ForgotPassword::class => [
            ForgotPasswordMail::class
        ],
        SendSellerOTP::class => [
            SellerRegistrationMail::class
        ],
        EmailVerify::class => [
            EmailVerifymail::class
        ],
        AskForQuote::class => [
            AskForQuoteMail::class
        ],
        AnswerForQuote::class => [
            AnswerForQuoteMail::class
        ],
        MakeBid::class => [
            MakeBidMail::class
        ]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Determine if events and listeners should be automatically discovered.
     *
     * @return bool
     */
    public function shouldDiscoverEvents()
    {
        return false;
    }
}
