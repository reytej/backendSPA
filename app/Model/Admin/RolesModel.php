<?php

namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class RolesModel extends Model
{
	protected $table = 'roles';

    protected $fillable = ['code', 'description'];
}
