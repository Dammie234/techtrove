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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('category_id')->unsigned();
            $table->string('title');
            $table->string('slug');
            $table->integer('price');
            $table->integer('sales_price')->nullable();
            $table->integer('qty');
            $table->string('sku');
            $table->integer('counts')->default('0');
            $table->mediumText('short_description');
            $table->mediumText('description');
            $table->mediumText('additional_information');
            $table->mediumText('images');
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
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
        Schema::dropIfExists('products');
    }
};
