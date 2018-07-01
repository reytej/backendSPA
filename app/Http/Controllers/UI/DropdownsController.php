<?php
namespace App\Http\Controllers\UI;
use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
use App\Model\Admin\RolesModel;

class DropDownsController extends MainController
{
    /**
     * getting roles formated for dropdowns
     *
     * @return \Illuminate\Http\Response
     */
    public function roles(Request $request){
        $options = array();
        $results = RolesModel::all();
        foreach ($results as $res) {
            $options[] = array('label' => "[".$res->code."] ".$res->description, 'value'=> $res->code);
        }
        return $this->sendResponse($options, 'Options Loaded');
    }
}