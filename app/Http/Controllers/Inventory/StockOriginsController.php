<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockOriginsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Illuminate\Support\Facades\Auth;
use Validator;

class StockOriginsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockOriginsModel::withTrashed()->get(), 'success');
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
            'origin' => 'required|unique:stock_divisions,division,'
        ];

        $validator = Validator::make($request->all(), $rules);

        $origin = new StockOriginsModel($request->except('_token'));
        $origin->origin = $request->origin;

        if (!($validator->fails()) && $origin->save()) {
            $origin_id = $origin->id;

            $data = array(
                'status'=>'success',
                'origin_id' => $origin_id
            );

            //return response()->json(['status'=>'success', 'response'=>$data]);
            return $this->sendResponse($origin, 'success');
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
        $som = new StockOriginsModel();
        $success = $som->where('id',$id)->update($request->all());
        return $this->sendResponse($success, 'Stock origin was updated successfully.');
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

        $deleteItem = StockOriginsModel::find($id);
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            return $this->sendResponse($deleteItem->trashed(), 'Stock origin was successfully deleted.');
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
