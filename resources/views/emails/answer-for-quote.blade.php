<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{ $data['buyer']['user']->first_name }}!</p>

        <p>Received Quote You Asked Product - {{ $data['product']->name }}</p>

        <p>Please check in </b><a href="https://www.harbourhubs.com/notifications">here notification</a></b></p>

        <p>You can make a Bid.</p>

        <p>
            If you have any questions, send us an email support@harbourhubs.com.
        </p>
        <p>
            <b>
                The Harbour Hub team
            </b>
        </p>
    </div>
</body>

</html>
