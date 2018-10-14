<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReferences extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('references', function (Blueprint $table) {
            $table->integer('id')->primary();
            $table->string('type_name')->unique();
            $table->integer('next_type_no')->default(1);
            $table->string('next_reference')->default('1');
            $table->timestamps();
        });


        // Insert some stuff
        $data = array(
            array(
                'id' => 10,
                'type_name' => 'Sales Invoice'
            ),
            array(
                'id' => 11,
                'type_name' => 'Credit Note'
            ),
            array(
                'id' => 12,
                'type_name' => 'Receipt'
            ),
            array(
                'id' => 13,
                'type_name' => 'Delivery'
            ),
            array(
                'id' => 16,
                'type_name' => 'Location Transfer'
            ),
            array(
                'id' => 17,
                'type_name' => 'Inventory Adjustment'
            ),
            array(
                'id' => 18,
                'type_name' => 'Purchase Order'
            ),
            array(
                'id' => 20,
                'type_name' => 'Supplier Invoice'
            ),
            array(
                'id' => 21,
                'type_name' => 'Supplier Credit Note'
            ),
            array(
                'id' => 22,
                'type_name' => 'Supplier Payment'
            ),
            array(
                'id' => 25,
                'type_name' => 'Purchase Order Delivery'
            ),
            array(
                'id' => 30,
                'type_name' => 'Sales Order'
            ),
            array(
                'id' => 32,
                'type_name' => 'Sales Quote'
            ),
            array(
                'id' => 101,
                'type_name' => 'Customer Refund'
            )
        );
        DB::table('references')->insert($data);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('references');
    }
}
