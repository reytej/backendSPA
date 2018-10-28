<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockDivisionsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class StockDivisionsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockDivisionsModel::withoutTrashed()->get(), 'success');
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
            'division' => 'required|unique:stock_divisions,division,'
        ];

        $validator = Validator::make($request->all(), $rules);

        $division = new StockDivisionsModel($request->except('_token'));
        $division->division = $request->division;

        if (!($validator->fails()) && $division->save()) {
            $division_id = $division->id;

            $data = array(
                'status'=>'success',
                'division_id' => $division_id
            );

            //return response()->json(['status'=>'success', 'response'=>$data]);
            return $this->sendResponse($data, 'Stock division was added successfully.');
        } else {
            $data = array(
                'status'=>'error',
                'errors' => $validator->errors(),
            );

            //return response()->json(['errors'=>$validator->errors()]);
            return $this->sendResponse($data,'');
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
    //public function update(Request $request)
    public function update(Request $request, $id)
    {
        //$id = $request->id;

        $rules = [
            //'division' => 'required|unique:stock_divisions,division,$id'
            'division' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        //$stock_division_model = StockDivisionsModel::find($request->id);
        $stock_division_model = StockDivisionsModel::find($id);
        $stock_division_model->division = $request->get('division');

        if (!($validator->fails()) && $stock_division_model->save()) {
            //return response()->json(['status'=>'success', 'response'=>$stock_division_model]);

            $data = array(
                'status'=>'success',
                'details' => $stock_division_model
            );

            return $this->sendResponse($data, 'Stock division was updated successfully.');
        }else{
            //return response()->json(['errors'=>$validator->errors()]);
            $data = array(
                'status'=>'error',
                'errors' => $validator->errors(),
            );

            return $this->sendResponse($data,'');

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
        //$deleteItem = StockDjvisionsModel::find($request->id);
        $deleteItem = StockDivisionsModel::find($id);
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            //return response()->json(['status'=>'success', 'message'=>'Stock division was successfully deleted']);
            return $this->sendResponse($deleteItem->trashed(), 'Stock division was successfully deleted.');
        }
    }
}
