<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{ $user->first_name }}!</p>

        <p>
            Your verification code is <b>{{ $user->otp }}</b>.
        </p>

        <p>
            If you have any questions, send us an email support@harbourhubs.com.
        </p>
        <p>
            We’re glad you’re here!
        </p>
        <p>
            The Harbour Hub team
        </p>
    </div>
</body>

</html>
