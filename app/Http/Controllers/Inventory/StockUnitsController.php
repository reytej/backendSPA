<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockUnitsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class StockUnitsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockUnitsModel::withTrashed()->get(), 'success');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'code' => 'required|unique:stock_units,code,'
        ];

        $validator = Validator::make($request->all(), $rules);

        $unit = new StockUnitsModel($request->except('_token'));
        $unit->code = $request->code;
        $unit->description = $request->description;
        $unit->qty = ($request->qty+0);

        if (!($validator->fails()) && $unit->save()) {
            $unit_code = $unit->code;

            $data = array(
                'status'=>'success',
                'unit_code' => $unit_code,
                'stock_unit' => $unit
            );

            return response()->json(['status'=>'success', 'response'=>$data]);
        } else {
            return response()->json(['errors'=>$validator->errors()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $rules = [
            'code' => 'required|unique:stock_units,code,$id'
        ];

        $validator = Validator::make($request->all(), $rules);

        $stock_unit_model = StockUnitsModel::find($id);
        //$stock_unit_model = StockUnitsModel::where('id', $id)->first();

        $stock_unit_model->division = $request->get('code');
        $stock_unit_model->description = $request->get('description');
        $stock_unit_model->qty = ($request->get('qty'))+0;

        if (!($validator->fails()) && $stock_unit_model->save()) {
            return response()->json(['status'=>'success', 'response'=>$stock_unit_model]);
        }else{
            return response()->json(['errors'=>$validator->errors()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    //public function delete(Request $request)
    public function delete($id)
    {
        $deleteItem = StockUnitsModel::find($id);
        //$deleteItem = StockUnitsModel::where('code', $id)->first();
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            return response()->json(['status'=>'success', 'message'=>'Stock unit was successfully deleted']);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
