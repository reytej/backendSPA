<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockItemsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class StockItemsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockItemsModel::withTrashed()->get(), 'success');
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
            'code' => 'required|unique:stock_items,code,',
            'category_id' => 'required',
            'division_id' => 'required',
            'origin_id' => 'required',
            'tax_type_id' => 'required',
            'description' => 'required',
            'default_uom' => 'required',
            'actual_cost' => 'required',
            'last_cost' => 'required',
            'qty_per_box' => 'required',
            'remarks' => 'required',
            'created_by' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        $item = new StockItemsModel($request->except('_token'));
        $item->code = $request->code;
        $item->category_id = $request->category_id;
        $item->division_id = $request->division_id;
        $item->origin_id = $request->origin_id;
        $item->tax_type_id = $request->tax_type_id;
        $item->description = $request->description;
        $item->default_uom = $request->default_uom;
        $item->actual_cost = ($request->actual_cost)+0;
        $item->last_cost = ($request->last_cost)+0;
        $item->qty_per_box = ($request->qty_per_box)+0;
        $item->remarks = $request->remarks;
        $item->created_by = $request->created_by;

        if (!($validator->fails()) && $item->save()) {
            $item_id = $item->id;

            $data = array(
                'status'=>'success',
                'item_id' => $item_id,
                'item' => $item
            );

            //return response()->json(['status'=>'success', 'response'=>$data]);
            return $this->sendResponse($item, 'Stock item ['.$request->code.'] '.$request->description.' was added successfully.');
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
        $sim = new StockItemsModel();
        $success = $sim->where('id',$id)->update($request->all());
        return $this->sendResponse($success, 'Stock item was updated successfully.');
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
        //echo 'ID:'.$request->id; die;

        //$deleteItem = StockLocationsModel::find($request->id);
        $deleteItem = StockItemsModel::find($id);
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            //return response()->json(['status'=>'success', 'message'=>'Stock location was successfully deleted']);
            return $this->sendResponse($deleteItem->trashed(), 'Stock item was successfully deleted.');
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
