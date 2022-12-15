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
        Schema::create('seller_business_accounts', function (Blueprint $table) {
            $table->uuid('id');
            $table->uuid('user_id')->index();
            $table->uuid('seller_id')->index();
            $table->string('account_name');
            $table->string('account_number');
            $table->string('bank_name');
            $table->string('company_position');
            $table->string('account_officer');
            $table->string('account_officer_phone');
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
        Schema::dropIfExists('seller_business_accounts');
    }
};
