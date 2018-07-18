<?php

namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 

class RolesModel extends Model
{
	use SoftDeletes;
    protected $table = 'roles';
    protected $fillable = ['code', 'description', 'pages'];
    /**
     * for soft delete.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];
    /**
     * Get user roles pages
     *
     * @var array
     */
    public function getPages($code=null){
        $pages = $this->select('pages');
        if($code){
            $pages->where('code',$code);
            return $pages->first();
        }
        else
            return $pages->get();
    }
}
