<?php
namespace App\Http\Controllers\UI;
use App\Model\Inventory\StockCategoriesModel;
use App\Model\Inventory\StockDivisionsModel;
use App\Model\Inventory\StockOriginsModel;
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
    /**
     * getting stock_categories used for dropdowns
     *
     * @return \Illuminate\Http\Response
     */
    public function stock_categories(Request $request){
        $options = array();
        $results = StockCategoriesModel::all();
        //$results = StockCategoriesModel::where('deleted_at', '')->get();
        foreach ($results as $res) {
            //$options[] = array('label' => $res->category, 'value'=> $res->id);
            $options[] = array('label' => "[".$res->id."] ".$res->category, 'value'=> $res->id);
        }
        return $this->sendResponse($options, 'Options Loaded');
    }
    /**
     * getting stock_divisions used for dropdowns
     *
     * @return \Illuminate\Http\Response
     */
    public function stock_divisions(Request $request){
        $options = array();
        $results = StockDivisionsModel::all();
        //$results = StockCategoriesModel::where('deleted_at', '')->get();
        foreach ($results as $res) {
            //$options[] = array('label' => $res->category, 'value'=> $res->id);
            $options[] = array('label' => "[".$res->id."] ".$res->division, 'value'=> $res->id);
        }
        return $this->sendResponse($options, 'Options Loaded');
    }
    /**
     * getting stock_origins used for dropdowns
     *
     * @return \Illuminate\Http\Response
     */
    public function stock_origins(Request $request){
        $options = array();
        $results = StockOriginsModel::all();
        //$results = StockCategoriesModel::where('deleted_at', '')->get();
        foreach ($results as $res) {
            //$options[] = array('label' => $res->origin, 'value'=> $res->id);
            $options[] = array('label' => "[".$res->id."] ".$res->origin, 'value'=> $res->id);
        }
        return $this->sendResponse($options, 'Options Loaded');
    }
}