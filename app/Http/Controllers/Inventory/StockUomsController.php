<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockUomsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class StockUomsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockUomsModel::withTrashed()->get(), 'success');
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
            'code' => 'required|unique:stock_uoms,code,',
            'description' => 'required',
            'qty' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        $uom = new StockUomsModel($request->except('_token'));
        $uom->code = $request->code;
        $uom->description = $request->description;
        $uom->qty = ($request->qty+0);

        if (!($validator->fails()) && $uom->save()) {
            $unit_code = $uom->id;

            $data = array(
                'status'=>'success',
                'uom_id' => $unit_code,
                'stock_uom' => $uom
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
            'code' => 'required|unique:stock_uoms,code,$id',
            'description' => 'required',
            'qty' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        $stock_unit_model = StockUomsModel::find($id);
        //$stock_unit_model = StockUnitsModel::where('id', $id)->first();

        $stock_unit_model->code = $request->get('code');
        $stock_unit_model->description = $request->get('description');
        $stock_unit_model->qty = ($request->get('qty'))+0;

        if (!($validator->fails()) && $stock_unit_model->save()) {
            return response()->json(['status'=>'success', 'response'=>$stock_unit_model]);
        }else{
            return response()->json(['errors'=>$validator->errors()]);
        }
    }

    /**
     * Soft-delete the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    //public function delete(Request $request)
    public function delete($id)
    {
        $deleteItem = StockUomsModel::find($id);
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
