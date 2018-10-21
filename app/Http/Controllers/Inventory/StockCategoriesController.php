<?php

namespace App\Http\Controllers\Inventory;

use App\Model\Inventory\StockCategoriesModel;
use Illuminate\Http\Request;
use App\Http\Controllers\MainController as MainController;
//use App\Http\Controllers\Controller;
use Carbon\Carbon;
//use Illuminate\Validation\Validator;
use Illuminate\Support\Facades\Validator;

//class StockCategoriesController extends Controller
class StockCategoriesController extends MainController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return $this->sendResponse(StockCategoriesModel::withTrashed()->get(), 'success');
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
            'category' => 'required|unique:stock_categories,category,'
        ];

        $validator = Validator::make($request->all(), $rules);

        $category = new StockCategoriesModel($request->except('_token'));
        $category->category = $request->category;

        if (!($validator->fails()) && $category->save()) {
            $category_id = $category->id;

            $data = array(
                'status'=>'success',
                'category_id' => $category_id
            );

            return response()->json(['status'=>'success', 'response'=>$data]);

            //\Session::flash('flash_message', 'Offer was successfully added to the product!');
            //\Session::flash('alert-class', 'alert-success');
            //return redirect($success_redirect);
        } else {
            //return redirect()->back()->withErrors($validator)->with('error', 'Error')->withInput();
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
    public function update(Request $request)
    {
        //echo 'Request ID: '.$request->id;
        //echo '===Category: '.$request->category;
        //die;

        $id = $request->id;

        $rules = [
            'category' => 'required|unique:stock_categories,category,$id'
        ];

        $validator = Validator::make($request->all(), $rules);

        $stock_category_model = StockCategoriesModel::find($request->id);
        $stock_category_model->category = $request->get('category');

        if (!($validator->fails()) && $stock_category_model->save()) {
            return response()->json(['status'=>'success', 'response'=>$stock_category_model]);
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
    public function delete(Request $request)
    {
        //echo 'ID:'.$request->id; die;

        $deleteItem = StockCategoriesModel::find($request->id);
        $deleteItem->delete();

        if ($deleteItem->trashed()) {
            return response()->json(['status'=>'success', 'message'=>'Stock category was successfully deleted']);
        }
    }
}
