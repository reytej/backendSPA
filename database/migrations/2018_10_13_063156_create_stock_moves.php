<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStockMoves extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_moves', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trans_type');
            $table->integer('trans_no');
            $table->integer('stock_id');
            $table->integer('location_id');
            $table->date('tran_date');
            $table->string('uom_id');
            $table->double('uom_multiplier');
            $table->double('qty');
            $table->double('price');
            $table->double('standard_cost');
            $table->double('pc_qty');
            $table->double('pc_price');
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
        Schema::dropIfExists('stock_moves');
    }
}
