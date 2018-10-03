<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class ItemsModel extends Model
{
	use SoftDeletes;
    protected $table = 'items';
    /**
     * for soft delete.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * Get the item category
     */
    public function category(){
        return $this->belongsTo('App\Model\Inventory\ItemCategoriesModel','category_id','id');
    }
    public function attributes(){
        return $this->hasMany('App\Model\Inventory\ItemAttributeValuesModel','item_id','id');
    }

}
