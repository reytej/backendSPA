<?php

namespace App\Model\Inventory;

use Illuminate\Database\Eloquent\Model;

class AttributeValuesModel extends Model
{
    protected $table = 'attribute_values';

    public function labels(){
        return $this->belongsTo('App\Model\Inventory\AttributesModel','attr_id','id');
    }
}
