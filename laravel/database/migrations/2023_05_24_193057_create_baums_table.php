<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('baeume', function (Blueprint $table) {
            $table->id();
            $table->string('gebiet');
            $table->string('platz');
            $table->bigInteger('baumart_id')->references('id')->on('baumarten');
            $table->point('standort'); // @TODO: check if this is the right type
            $table->string('baumnummer');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('baeume');
    }
};
