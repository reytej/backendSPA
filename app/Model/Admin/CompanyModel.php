<?php
namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class CompanyModel extends Model
{
    protected $table = 'company';
    protected $guarded = ['id'];
}
