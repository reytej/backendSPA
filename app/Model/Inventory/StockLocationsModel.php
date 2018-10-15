<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;
use DB;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

class StockLocationsModel extends Model
{
    use SoftDeletes;
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = "stock_locations";

    protected $guarded = ['id'];
    protected $dates = ['created_at', 'updated_at', 'deleted_at'];
}
