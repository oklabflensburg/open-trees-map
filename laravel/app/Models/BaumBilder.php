<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use App\Models\Baum;

class BaumBilder extends Model
{
    use HasFactory;

    protected $table = 'baumbilder';

    public function Baum(): BelongsTo
    {
        return $this->belongsTo(Baum::class);
    }
}
