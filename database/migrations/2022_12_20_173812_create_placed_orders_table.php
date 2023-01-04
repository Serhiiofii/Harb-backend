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
        Schema::create('placed_orders', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->index();
            $table->uuid('equipment_id')->index()->nullable();
            $table->uuid('seller_id');
            $table->string('details')->nullable();
            $table->decimal('amount',64,2);
            $table->string('status');
            $table->string('category'); //'equipment', 'service'
            $table->string('checkout_reference');
            $table->uuid('sale_type')->nullable();//sale or rent
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
        Schema::dropIfExists('placed_orders');
    }
};
