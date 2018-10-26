<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockLocationsModel;
use Illuminate\Http\Request;
//use App\Http\Controllers\Controller;
use App\Http\Controllers\MainController as MainController;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class StockLocationsController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockLocationsModel::withTrashed()->get(), 'success');
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
            'location' => 'required|unique:stock_locations,location,',
            'address' => 'required',
            'contact' => 'required',
            'phone' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        $location = new StockLocationsModel($request->except('_token'));
        $location->location = $request->location;
        $location->address = $request->address;
        $location->contact = $request->contact;
        $location->phone = $request->phone;

        if (!($validator->fails()) && $location->save()) {
            $location_id = $location->id;

            $data = array(
                'status'=>'success',
                'location_id' => $location_id,
                'location' => $location
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
        //$id = $request->id;
        //With Validation
        /**
        $rules = [
            'location' => 'required|unique:stock_locations,location,$id',
            'address' => 'required',
            'contact' => 'required',
            'phone' => 'required'
        ];

        $validator = Validator::make($request->all(), $rules);

        $slm = new StockLocationsModel();
        $success = $slm->where('id',$id)->update($request->all());

        if (!($validator->fails()) && $success) {
            return $this->sendResponse($success, 'Stock location was updated successfully.');
        }else{
            return response()->json(['errors'=>$validator->errors()]);
        }

        **/

        $slm = new StockLocationsModel();
        $success = $slm->where('id',$id)->update($request->all());
        return $this->sendResponse($success, 'Stock location was updated successfully.');
    }

    /**
     * Soft-delete the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function delete(Request $request)
    {
        //echo 'ID:'.$request->id; die;

        $deleteItem = StockLocationsModel::find($request->id);
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            return response()->json(['status'=>'success', 'message'=>'Stock location was successfully deleted']);
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
        //return $this->sendResponse(StockLocationsModel::destroy($id), 'success');
    }
}
