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
        Schema::create('payments', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->index();
            $table->uuid('equipment_id')->index()->nullable();
            $table->string('sale_type');//'sale' or 'rent'
            $table->string('category'); //'equipment', 'service'
            $table->decimal('amount',64,2);
            $table->string('checkout_id');
            $table->string('reference');
            // $table->string('checkout_id');
            $table->string('status')->default('pending');//'received' or 'sent' or 'pending'
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
        Schema::dropIfExists('payments');
    }
};
