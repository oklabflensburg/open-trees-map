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
        Schema::create('baums', function (Blueprint $table) {
            $table->id();
            $table->string('ort');
            $table->bigInteger('baumart_id')->references('id')->on('baumarts');
            $table->point('standort'); // @TODO: check if this is the right type
            $table->string('model');
            $table->integer('pflanzjahr');
            $table->integer('umfang');
            $table->integer('krone');
            $table->integer('hoehe');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('baums');
    }
};
