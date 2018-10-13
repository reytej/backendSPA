<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStockItems extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_items', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code')->unique();
            $table->integer('category_id');
            $table->integer('division_id');
            $table->integer('origin_id');
            $table->integer('tax_type_id');
            $table->string('description')->unique();
            $table->string('default_uom');
            $table->double('actual_cost');
            $table->double('last_cost');
            $table->double('qty_per_box');
            $table->string('remarks');
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
        Schema::dropIfExists('stock_items');
    }
}
