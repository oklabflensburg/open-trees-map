<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\File;
use Illuminate\Validation\Rule;
use App\Models\Baum;
use App\Models\BaumBilder;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\ImageUploadRequest;
use Illuminate\Support\Facades\Session;

class TreeController extends Controller
{
    //
    public function imageupload(ImageUploadRequest $request)
    {
        $filename = Str::uuid();
        $fileR = $request->file("file");
        $ext = $fileR->extension();
        $fileR->storeAs('/' . $filename . '.' . $ext);
        Session::flash('status', 'Danke für den Upload');
        return back();
        /*$file = new BaumBilder();
        $file->filename = $filename . '.' . $ext;
        $file->user_id = Auth::id();
        $file->size = $fileR->getSize();
        $file->save();*/
    }

    public function test(Request $request)
    {
        $baum = Baum::select('*');
        if(isset($request->name))
        {
            $baum->where('name', '=', 'asdf');
        }
        if(isset($request->große))
        {
            $baum->where('große', '>', 'asdf');
        }
        $baum->get();
        return $baum;
    }
}
