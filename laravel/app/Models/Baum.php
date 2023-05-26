<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\BaumBilder;

class Baum extends Model
{
    use HasFactory;

    public function Bilder()
    {
        return $this->hasMany(BaumBilder::class);
    }
}
