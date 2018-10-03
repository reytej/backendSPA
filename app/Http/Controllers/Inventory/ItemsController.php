<?php
namespace App\Http\Controllers\Inventory;

use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Inventory\ItemsModel;
use Validator;

class ItemsController extends MainController
{
    /**
     * get all items
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request,$id=null){
        $result = null;
        $width = array();
        if($request->details && $request->details == 'all'){
            $width = array('category','attributes.values.labels');
        }
        else{
            $width = array('category');
        }
        $query = ItemsModel::with($width);
        if($id != null){
            $result = $query->first();
        }
        else{
            $result = $query->get();
        }
        return $this->sendResponse($result, 'success');
    }
}