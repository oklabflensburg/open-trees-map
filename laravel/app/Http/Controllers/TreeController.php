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
use proj4php\Proj4php;
use proj4php\Proj;
use proj4php\Point;
use PHPCoord\UTMRef;


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


        /*$proj4 = new Proj4php();

        // Create two different projections.
        $projVon    = new Proj('EPSG:25832', $proj4);
        $projZu  = new Proj('EPSG:4326', $proj4);

        // Create a point.
        $pointSrc = new Point(6.07041046782e+06, 3.52716721416e+06, $projVon);
        //$pointSrc = new Point(3.52716721416e+06, 6.07041046782e+06,$projVon);
        echo "Source: " . $pointSrc->toShortString() . " in EPSG:25832 <br>";

        // Transform the point between datums.
        $pointDest = $proj4->transform($projZu, $pointSrc);
        echo "Conversion: " . $pointDest->toShortString() . " in WGS84<br><br>";
        dd($pointSrc, $pointDest);
        */
        /*$utm = new UTMRef(6.07041046782e+06, 3.52716721416e+06, '32U');
        // Wandle die Koordinaten in das Lat-Lon-Format (EPSG:4326) um
        $latLon = $utm->toLatLng();

        // Hole die transformierten Koordinaten
        $latitude = $latLon->getLat();
        $longitude = $latLon->getLng();

        dd($latitude, $longitude);*/

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
