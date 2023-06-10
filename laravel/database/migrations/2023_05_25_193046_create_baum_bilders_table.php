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
        Schema::create('baumbilder', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('baum_id')->references('id')->on('baeume');
            $table->string('filename');
            $table->integer('filegroesse');
            $table->bigInteger('user_id')->references('id')->on('users');
            $table->tinyInteger('status')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('baumbilder');
    }
};
