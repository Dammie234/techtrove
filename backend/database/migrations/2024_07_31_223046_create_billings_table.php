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
        Schema::create('billings', function (Blueprint $table) {
            $table->id();
            $table->string('lastname');
            $table->string('firstname');
            $table->string('company_name')->nullable();
            $table->string('country');
            $table->string('street_address');
            $table->string('city');
            $table->string('state');
            $table->string('postal_code');
            $table->string('phone');
            $table->string('email');
            $table->integer('total');
            $table->string('payment_type');
            $table->integer('delivery_fee');
            $table->mediumText('notes')->nullable();
            $table->boolean('payment_approval')->default('0');
            $table->boolean('delivered')->default('0');
            $table->string('payment_image');
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
        Schema::dropIfExists('billings');
    }
};
