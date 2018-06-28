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
});
Route::middleware('auth:api')->namespace('Admin\Users')->group(function(){
	Route::post('users','UsersController@index');

	Route::post('roles','RolesController@index');
	Route::post('roles/create','RolesController@create');
	Route::post('roles/update/{id}','RolesController@update');
});
