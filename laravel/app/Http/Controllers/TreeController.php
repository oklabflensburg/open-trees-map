<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use mysqli_result;

class TreeController extends Controller
{
    //
    public function imageupload(Request $request)
    {
        if ($request('file')->isValid()) {
            $filename = Str::uuid();
            $fileR = $request->file("file");
            $ext = $fileR->extension();
            $fileR->storeAs('/' . $filename . '.' . $ext);
            /*$file = new File();
            $file->filename = $filename . '.' . $ext;
            $file->user_id = $token->user_id;
            $file->size = $fileR->getSize();*/

        } else {
            return 404;
        }
    }
}
