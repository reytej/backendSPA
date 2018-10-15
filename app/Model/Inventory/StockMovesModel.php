<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;
use DB;
use Carbon\Carbon;

class StockMovesModel extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = "stock_moves";

    protected $guarded = ['id'];
    protected $dates = ['created_at', 'updated_at'];
}
