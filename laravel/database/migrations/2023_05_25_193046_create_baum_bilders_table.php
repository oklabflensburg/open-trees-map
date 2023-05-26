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
        Schema::create('baum_bilders', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('baum_id')->references('id')->on('baums');
            $table->string('filename');
            $table->integer('filegroesse');
            //$table->bigInteger('user_id')->references('id')->on('users');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('baum_bilders');
    }
};
