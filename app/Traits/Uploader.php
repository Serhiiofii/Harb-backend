<?php

namespace App\Traits;

trait SaveImage
{
    public function saveFile($file, $path = 'images')
    {
        $filename = date('YmdHi') . $file->getClientOriginalName();
        $filename = explode(' ', $filename);
        $filename = implode('-', $filename);
        $file->move(public_path($path), $filename);
        $savedFile = config('app.url') . '/' . $path . '/' . $filename;
        return $savedFile;
    }
}
