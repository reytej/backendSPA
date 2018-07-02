<?php

namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class RolesModel extends Model
{
	use SoftDeletes;
	
	/**
     * for soft delete.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

	protected $table = 'roles';

    protected $fillable = ['code', 'description'];
}
