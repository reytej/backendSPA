<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockTransfersModel extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = "stock_transfers";

    protected $guarded = ['id'];
}
