<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{ $data['buyer']->first_name }}!</p>

        <p>{{ $data['seller']->company_mane }} {{ $data['bid']->status }}  your bid for {{ $data['product']->name }}</p>

        <p>Please check <b><a href="https://www.harbourhubs.com/my-orders">your checkout page</a></b> or </b><a href="https://www.harbourhubs.com/notifications">notification</a></b></p>

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
