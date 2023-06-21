<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Baumart;
use App\Models\Baum;
use Psy\Readline\Hoa\Console;

class parsegeojsontodb extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:parsegeojsontodb';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'geojson to db import';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Online
        //$geojson = json_decode(file_get_contents('https://raw.githubusercontent.com/oklabflensburg/open-trees-map/main/data/baumkataster_flensburg.geojson'));
        // Offline
        $geojson = json_decode(file_get_contents(resource_path() . '/data/baumkataster_flensbugr.geojson'));
        $baumartunbekannt = Baumart::where('latein', 'Unbekannt')->first();
        $bar = $this->output->createProgressBar(count($geojson->features));
        $bar->start();
        foreach ($geojson->features as $name => $json) {
            $baum = new Baum();
            // Gibt es die Baumart schon? (type)
            $json->properties->type = str_replace('"', '', $json->properties->type);
            if ($json->properties->type != 'Baumgruppe/flächiger Bestand' && $json->properties->type != 'Baumbestand') {
                if ($json->properties->type == 'Platanus x hispanica Gewöhnliche Platane(ehe. acerifolia)') {
                    $baumartlatein = 'Platanus x hispanica';
                    $baumartdeutsch = 'Gewöhnliche Platane';
                } elseif ($json->properties->type == 'Ulmus resista \'Sapporo Gold\'') {
                    $baumartlatein = 'Ulmus resista \'Sapporo Gold\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Prunus hillerii \'Spire\'') {
                    $baumartlatein = 'Prunus hillerii \'Spire\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Pyrus calleriana \'Chanticleer\'') {
                    $baumartlatein = 'Pyrus calleriana \'Chanticleer\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Prunus sargentii \'Accolade\'') {
                    $baumartlatein = 'Prunus sargentii \'Accolade\'';
                    $baumartdeutsch = 'Berg-Kirsche';
                } elseif ($json->properties->type == 'Tilia cf. x flaccida') {
                    $baumartlatein = 'Tilia cf. x flaccida';
                    $baumartdeutsch = 'Linde'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btdetails.php?id=2850&suchstring=%&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Ulmus resista \'New Horizon\'') {
                    $baumartlatein = 'Ulmus resista \'New Horizon\'';
                    $baumartdeutsch = 'Resista-Ulme'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif($json->properties->type =='Malus \'Eleyi\' Zierapfelsorte') {
                    $baumartlatein = 'Malus \'Eleyi\'';
                    $baumartdeutsch = 'Zierapfelsorte';
                } elseif ($json->properties->type == 'Sorbus aria \'Lutescens\'') {
                    $baumartlatein = 'Sorbus aria \'Lutescens\''; // To check
                    $baumartdeutsch = 'Echte Mehlbeere'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Acer Platanoides \'Deborah\'') {
                    $baumartlatein = 'Acer Platanoides \'Deborah\'';
                    $baumartdeutsch = 'Spitz-Ahorn'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'tilia cordata \'Rancho\'') {
                    $baumartlatein = 'Tilia cordata \'Rancho\'';
                    $baumartdeutsch = 'Winter-Linde'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Malus van Eseltine') {
                    $baumartlatein = 'Malus van Eseltine';
                    $baumartdeutsch = 'Zierapfelsorte'; // https://www.baumschule-horstmann.de/shop/exec/product/729/8259/Zierapfel-Van-Eseltine.html
                } elseif ($json->properties->type == 'Malus \'Rudolph\'') {
                    $baumartlatein = 'Malus Cultivar \'Rudolph\''; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                    $baumartdeutsch = 'Zierapfelsorte';
                } elseif ($json->properties->type == 'Prunus serrulata \'Royal Burgundy\'') {
                    $baumartlatein = 'Prunus serrulata \'Royal Burgundy\'';
                    $baumartdeutsch = 'Rotblättrige Nelken-Kirsche'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Fraxinus pen. \'Summit Ash\'') {
                    $baumartlatein = 'Fraxinus pennsylvanica \'Summit\'';
                    $baumartdeutsch = 'Grün-Esche'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Sorbus incana') {
                    $baumartlatein = 'Sorbus incana';
                    $baumartdeutsch = 'Silber-Mehlbeere'; // https://www.lve-baumschule.de/sorbus-incana/6355495
                } elseif ($json->properties->type == 'Fraxinus excelsior \'Nana\'') {
                    $baumartlatein = 'Fraxinus excelsior \'Nana\'';
                    $baumartdeutsch = 'Kugel-Esche'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Sorbus commixta \'Dodong\'') {
                    $baumartlatein = 'Sorbus commixta \'Dodong\'';
                    $baumartdeutsch = 'Koreanische Eberesche'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Liquidambar styr. \'Worplesdon\'') {
                    $baumartlatein = 'Liquidambar styraciflua \'Worplesdon\'';
                    $baumartdeutsch = 'Amerikanischer Amberbaum'; // https://projekte.uni-hohenheim.de/gartenbau/bteinfachdb/btindex.php?id=982&suchstring=&zaehler=&mailvar=&stamp=
                } elseif ($json->properties->type == 'Robinia pseudoacacia \'Semperflorens\'') {
                    $baumartlatein = 'Robinia pseudoacacia \'Semperflorens\'';
                    $baumartdeutsch = 'Öfterblühende Robinie';
                } elseif ($json->properties->type == 'Tilia europaea \'Pallida\'') {
                    $baumartlatein = 'Tilia europaea \'Pallida\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Prunus Kassins frühe Herzkische') {
                    $baumartlatein = 'Prunus Kassins';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Malus Gelbe Schleswiger Renette - Apfel') {
                    $baumartlatein = 'Malus \'Gelbe Schleswiger Renette\'';
                    $baumartdeutsch = 'Herbstapfel'; // https://www.baumschule-horstmann.de/shop/exec/product/68/6504/Herbstapfel-Gelbe-Schleswiger-Renette.html
                } elseif ($json->properties->type == 'Pyrus Augustbirne') {
                    $baumartlatein = 'Pyrus \'Augustbirne\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Malus Stahls Winterprinz') {
                    $baumartlatein = 'Malus \'Stahls Winterprinz\'';
                    $baumartdeutsch = 'Winterapfel'; // https://www.baumschule-horstmann.de/shop/exec/product/69/6604/Winterapfel-Stahls-Winterprinz.html
                } elseif ($json->properties->type == 'Prunus Morellenfeuer - Kirsche') {
                    $baumartlatein = 'Prunus \'Morellenfeuer\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Malus Doppelmelone') {
                    $baumartlatein = 'Malus \'Doppelmelone\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Fraxinus americana\'Autumn Purple\'') {
                    $baumartlatein = 'Fraxinus americana \'Autumn Purple\'';
                    $baumartdeutsch = 'Weiß-Esche';
                } elseif ($json->properties->type == 'Prunus serrulata \'Pink Perfection\'') {
                    $baumartlatein = 'Prunus Sato-zakura-Grp. \'Pink Perfection\'';
                    $baumartdeutsch = 'Japanische Blüten-Kirsche';
                } elseif ($json->properties->type == 'Acer platanoides Royal Red') {
                    $baumartlatein = 'Acer platanoides \'Royal Red\'';
                    $baumartdeutsch = 'Spitz-Ahorn';
                } elseif ($json->properties->type == 'Gleditsia triacanthos \'Strademaster\'') {
                    $baumartlatein = 'Gleditsia triacanthos \'Strademaster\'';
                    $baumartdeutsch = ' Amerikanische Gleditschie - Falscher Christusdorn';
                } elseif ($json->properties->type == 'Sorbua aria \'Majestica\'') {
                    $baumartlatein = 'Sorbua aria \'Majestica\'';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Prunus x gondouinii \'Schnee\'') {
                    $baumartlatein = 'Prunus x gondouinii \'Schnee\'';
                    $baumartdeutsch = 'Zier-Kirsche';
                } elseif ($json->properties->type == 'Ulmus rubra') {
                    $baumartlatein = 'Ulmus rubra';
                    $baumartdeutsch = '';
                } elseif ($json->properties->type == 'Alnus glutinosa Laciniata') {
                    $baumartlatein = 'Alnus glutinosa \'Laciniata\'';
                    $baumartdeutsch = 'Schwarz-Erle';
                } elseif ($json->properties->type == 'Carpinus betulus \'Lucas\'') {
                    $baumartlatein = 'Carpinus betulus \'Lucas\'';
                    $baumartdeutsch = 'Hagebuche';
                } else {
                    $baumart = explode(',', $json->properties->type);
                    $baumartlatein = trim($baumart[0]);
                    if (isset($baumart[1]))
                        $baumartdeutsch = trim($baumart[1]);
                    else
                        $baumartdeutsch = '';
                }
                $check1 = Baumart::where('latein', $baumartlatein)->first();
                if (isset($check1->id)) {
                    $baum->baumart_id = $check1->id;
                } else {
                    // Latein Name nicht gefunden, also nach Deutsch suchen
                    $check2 = Baumart::where('deutsch', $baumartdeutsch)->first();
                    if (isset($check2->id)) {
                        $baum->baumart_id = $check2->id;
                    } else {
                        // Baumart Anlegen wenn Latein oder Deutsch nicht gefunden worden ist.
                        $baumart = new Baumart();
                        $baumart->latein = $baumartlatein;
                        if($baumartdeutsch != '')
                            $baumart->deutsch = $baumartdeutsch;
                        else
                            unset($baumart->deutsch);
                        $baumart->save();
                        $baum->baumart_id = $baumart->id;
                    }
                }
            } else {
                $baum->baumart_id = $baumartunbekannt->id;
            }
            $baum->baumnummer = $json->properties->baumnummer;
            $baum->standort = \Illuminate\Support\Facades\DB::raw('ST_GeomFromText(\'POINT(' . $json->geometry->coordinates[1] . ' ' . $json->geometry->coordinates[0] . ')\')');
            $baum->gebiet = $json->properties->GEBIET;
            $baum->platz = $json->properties->place;
            $baum->save();
            $bar->advance();
        }
        $bar->finish();
    }
}
