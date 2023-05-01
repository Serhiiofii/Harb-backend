<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>

<body>
    <div class="container">
        <p>Hi {{ $data['seller']->company_name }} company!</p>

        <p>Bid for {{ $data['equipment']->name }} - {{ $data->amount }} has been placed by {{ $data['user']->first_name }}</p>

        <p>Please check in </b><a href="https://www.harbourhubs.com/notifications">here notification</a></b></p>

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
