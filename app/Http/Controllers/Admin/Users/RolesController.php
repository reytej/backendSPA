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
        return $this->sendResponse(RolesModel::all(), 'success');
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
     * update a role
     *
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id){
        $role = Article::findOrFail($id);
        $role->update($request->all());
        return $this->sendResponse($role, 'success');
    }
}