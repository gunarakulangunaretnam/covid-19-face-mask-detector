<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::post('/login_function',"MainController@LoginFunction");

Route::get('/view_dashboard_home',"MainController@ViewDashboardHome");

Route::get('/settings',"MainController@ViewSettings");

Route::post('/change_language',"MainController@ChangeLanguage");

Route::post('/change_password',"MainController@ChangePassword");

Route::get('/delete_data/{auto_id}/{filename}',"MainController@DeleteData");

Route::get('/logout',"MainController@Logout");
