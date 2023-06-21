<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        // Test User mit Baumart, Baum und Bild erstellen
        $user = \App\Models\User::factory()->create([
            'name' => 'Test User',
            'email' => 'test@test.test',
            'password' => Hash::make('test'),
            'email_verified_at' => \Carbon\Carbon::now(),
        ]);
        $baumart = \App\Models\Baumart::create([
            'latein' => 'Unbekannt',
            'deutsch' => 'Unbekannt',
            'daenisch' => 'Unbekannt',
        ]);
        /*$baum = \App\Models\Baum::create([
            'ort' => 'Test Ort',
            'baumart_id' => $baumart->id,
            'standort' => \Illuminate\Support\Facades\DB::raw('ST_GeomFromText(\'POINT(55.676098 12.568337)\')'),
            'model' => 'Test Model',
            'pflanzjahr' => 2023,
            'umfang' => 10,
            'krone' => 10,
            'hoehe' => 10,
        ]);
        \App\Models\BaumBilder::create([
            'baum_id' => $baum->id,
            'user_id' => $user->id,
            'filename' => 'test.jpg',
            'filegroesse' => 1000,
            'status' => 1,
        ]);*/
    }
}
