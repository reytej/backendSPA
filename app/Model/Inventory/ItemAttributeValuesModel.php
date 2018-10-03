<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;

class ItemAttributeValuesModel extends Model
{
    protected $table = 'item_attribute_values';

    public function values(){
        return $this->belongsTo('App\Model\Inventory\AttributeValuesModel','attr_val_id','id');
    }
}
