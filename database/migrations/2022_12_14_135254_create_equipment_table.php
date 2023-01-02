<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('equipment', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->index();
            $table->uuid('seller_id')->index();
            $table->string('name');
            $table->string('category');
            $table->string('manufacturer');
            $table->string('equipment_specification');
            $table->string('build_year');
            $table->string('sale_type');//'sale' or 'rent'
            $table->string('description');
            $table->unsignedBigInteger('view_count')->default(0)->nullable();
            // $table->unsignedBigInteger('sale_count')->default(0)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('equipment');
    }
};
