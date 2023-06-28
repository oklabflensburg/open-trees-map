<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Baum;
use App\Models\BaumBilder;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\ImageUploadRequest;
use Illuminate\Support\Facades\Session;
use geoPHP;
use Illuminate\Support\Facades\Storage


class TreeController extends Controller
{
    //
    public function imageupload(ImageUploadRequest $request)
    {
        $filename = Str::uuid();
        $fileR = $request->file("file");
        $ext = $fileR->extension();
        $fileR->storePubliclyAs('public/' . $filename . '.' . $ext);
        $file = new BaumBilder();
        $file->filename = $filename . '.' . $ext;
        $file->user_id = Auth::id();
        $file->baum_id = $request->baum_id;
        $file->filegroesse = $fileR->getSize();
        if ($file->save()) {
            Session::flash('status', 'Danke für den Upload');
        } else {
            // Lösche File wieder weil DB Eintrag nicht möglich war
            Storage::delete('public/' . $filename . '.' . $ext);
        }
        return back();
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
                        $point->coords[1],
                        $point->coords[0]
                    ]
                ],
                'properties' => [
                    'id' => $baum->id,
                    'place' => $baum->ort,
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

    public function show(Baum $baum)
    {
        // Um die Bilder von dem ausgewählten baum zu holen
        $baum->Bilder;
        return $baum;
    }
}
