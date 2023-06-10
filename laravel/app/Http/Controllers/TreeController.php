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
use geoPHP;


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
        // Alle Bäume mit Baumart laden und Punkt als WKT laden
        // Vielleicht kann man das auch mit Eloquent lösen, aber ich habe es nicht hinbekommen
        $baeume = Baum::with('baumart')->selectRaw('*, ST_AsText(standort) as point')->get();
        $data = [];
        foreach ($baeume as $baum) {
            // Point von WKT in coords umwandeln mit geoPHP
            $point = geoPHP::load($baum->point, 'wkt');
            $data[] = (object)[
                'type' => 'Feature',
                'geometry' => [
                    'type' => 'Point',
                    'coordinates' => [
                        $point->coords[0],
                        $point->coords[1]
                    ]
                ],
                'properties' => [
                    'id' => '100033772',
                    'place' => 'Straßenbegleitgrün: Buerelterstraße',
                    'type' => $baum->baumart->deutsch,
                    'model' => '',
                    'tribs' => '1',
                    'crown' => '12',
                    'plant' => '',
                    'scope' => '165',
                    'scopes' => '',
                    'height' => ''
                ]
            ];
        }
        $geotestarray = (object)['type' => 'FeatureCollection', 'crs' => ['type' => 'name', 'properties' => ['name' => 'urn:ogc:def:crs:OGC:1.3:CRS84']], 'features' => $data];
        return $geotestarray;
    }
}
