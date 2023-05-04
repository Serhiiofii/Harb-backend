<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{ $data['product']['seller']->company_name }} company!</p>

        <p>{{ $data['buyer']->first_name }} are asking for quote of your product - {{ $data['product']['name'] }}</p>

        <p>To provide a Quote, Please check <b><a href="https://www.harbourhubs.com/seller/products">product pages</a></b> or <b><a href="https://www.harbourhubs.com/notifications">notification</a></b></p>

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
