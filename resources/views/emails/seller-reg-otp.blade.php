<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{$data['first_name']}},</p> <br>
        <p>Your otp code to validate seller registration is <b>{{$data['otp']}}</b></p>
    </div>
</body>

</html>