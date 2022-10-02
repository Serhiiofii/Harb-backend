<?php

namespace App\Traits;

trait ApiResponse
{
    public function success($status, $message, $data = null, $statusCode = 200)
    {
        return response()->json(['status' => $status, 'message' => $message, 'data' => $data], $statusCode);
    }

    public function error($status, $message, $data, $statusCode = 500)
    {
        return response()->json(['status' => $status, 'message' => $message, 'data' => $data], $statusCode);
    }
}
