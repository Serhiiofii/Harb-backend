<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{$user['first_name']}},</p> <br>
        <p>An administrator account has been created using this details</p> <br>
        <p>
            Email: <b>{{$user['email']}}</b><br>
            Password: <b>{{$user['password']}}</b>
        </p>
    </div>
</body>

</html>