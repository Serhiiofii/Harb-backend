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
        \Illuminate\Support\Facades\DB::statement('SET SESSION sql_require_primary_key=0');
        Schema::create('product_bids', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->index();
            $table->uuid('seller_id')->index();
            $table->uuid('equipment_id')->index()->nullable();
            // $table->uuid('service_id')->index()->nullable();
            $table->decimal('amount',64,2);
            // $table->unsignedInteger('quantity')->default(1);
            $table->string('status')->nullable();//'accepted','declined','pending'
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
        Schema::dropIfExists('product_bids');
    }
};
