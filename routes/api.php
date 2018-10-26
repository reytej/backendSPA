<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::post('register', 'Admin\Users\UsersController@register');
Route::post('login', 'Admin\Users\UsersController@login');
Route::middleware('auth:api')->namespace('Admin\Configs')->group(function(){
    Route::post('getConfigs','ConfigurationsController@getConfigurations');
    Route::post('company','CompanyController@index');
    Route::post('company/update','CompanyController@update');
});
Route::middleware('auth:api')->namespace('Admin\Users')->group(function(){
    Route::post('users','UsersController@index');
    Route::post('users/create','UsersController@create');
    Route::post('users/update/{id}','UsersController@update');
    Route::post('users/destroy/{id}','UsersController@destroy');
    Route::post('users/restore/{id}','UsersController@restore');

    Route::post('roles','RolesController@index');
    Route::post('roles/create','RolesController@create');
    Route::post('roles/update/{id}','RolesController@update');
    Route::post('roles/destroy/{id}','RolesController@destroy');
    Route::post('roles/restore/{id}','RolesController@restore');
    Route::post('roles/get/{id}','RolesController@getRole');
});
Route::middleware('auth:api')->namespace('UI')->group(function(){
    Route::post('dropdowns/roles','DropdownsController@roles');
});
// Route::namespace('Inventory')->group(function(){
Route::middleware('auth:api')->namespace('Inventory')->group(function(){
    Route::post('items','ItemsController@index');
    Route::post('items/{id}','ItemsController@index');

    Route::post('stock_categories','StockCategoriesController@index');
    Route::post('stock_categories/store','StockCategoriesController@store');
    Route::post('stock_categories/update/{id}','StockCategoriesController@update');
    Route::post('stock_categories/delete/{id}', 'StockCategoriesController@delete');

    Route::post('stock_divisions','StockDivisionsController@index');
    Route::post('stock_divisions/store','StockDivisionsController@store');
    Route::post('stock_divisions/update/{id}','StockDivisionsController@update');
    Route::post('stock_divisions/delete/{id}', 'StockDivisionsController@delete');

    Route::post('stock_locations','StockLocationsController@index');
    Route::post('stock_locations/store','StockLocationsController@store');
    Route::post('stock_locations/update/{id}','StockLocationsController@update');
    Route::post('stock_locations/delete/{id}', 'StockLocationsController@delete');

    Route::post('stock_origins','StockOriginsController@index');
    Route::post('stock_origins/store','StockOriginsController@store');
    Route::post('stock_origins/update/{id}','StockOriginsController@update');
    Route::post('stock_origins/delete/{id}', 'StockOriginsController@delete');

});
