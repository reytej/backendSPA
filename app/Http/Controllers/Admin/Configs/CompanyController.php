<?php
namespace App\Http\Controllers\Admin\Configs;

use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Admin\CompanyModel;
use Validator;

class CompanyController extends MainController
{
    /**
     * get all users
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return $this->sendResponse(CompanyModel::first(), 'success');
    }
    /**
     * update a user
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request){
        $mdl = new CompanyModel();
        $success = $mdl->where('id',1)->update($request->all());
        return $this->sendResponse($success, 'Company details updated successfully.');
    }
}