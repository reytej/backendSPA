<?php
namespace App\Http\Controllers\Admin\Users;

use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Admin\RolesModel;
use Illuminate\Support\Facades\Auth;
use Validator;

class RolesController extends MainController
{
    /**
     * get all roles
     *
     * @return \Illuminate\Http\Response
     */
    public function index(){
        return $this->sendResponse(RolesModel::withTrashed()->get(), 'success');
    }
    /**
     * get specific role
     *
     * @return \Illuminate\Http\Response
     */
    public function getRole($id){
        $mdl = RolesModel::withTrashed()
                         ->where('id',$id);
        return $this->sendResponse($mdl->first(), 'success');
    }
    /**
     * create a role
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request){
        $created = RolesModel::create($request->all());
        return $this->sendResponse($created, 'success');
    }
    /**
     * update a user
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id){
        $mdl = new RolesModel();
        $success = $mdl->where('id',$id)->update($request->all());
        return $this->sendResponse($success, 'Role update successfully.');
    }
    /**
     * delete a role
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy($id){
        return $this->sendResponse(RolesModel::destroy($id), 'success');
    }
    /**
     * restore a role
     *
     * @return \Illuminate\Http\Response
     */
    public function restore($id){
        return $this->sendResponse(RolesModel::withTrashed()->where('id',$id)->restore(), 'success');
    }
}