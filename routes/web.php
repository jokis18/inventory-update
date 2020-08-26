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

// Route::get('/', function () {
//     return view('welcome');
// })->middleware(['auth.shopify']);
Route::get('/', 'ShopifyController@index')->middleware(['auth.shopify'])->name('home');
//Route::get('/home', 'ShopifyController@index')->name('home');
Route::post('/import_csv', 'ShopifyController@store')->middleware(['auth.shopify']);
Route::post('/allvariants', 'ShopifyController@show')->middleware(['auth.shopify']);
Route::post('/ExportCSV', 'ShopifyController@edit')->middleware(['auth.shopify']);