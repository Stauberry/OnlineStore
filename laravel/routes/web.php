<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/about', function () {
    return 'about page';
});


//не авторизованная часть
Route::group(['middleware' => ['guest']], function () {
    Route::get('/landing', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
});

//страницы для авторизованных и не авторизованных пользователей
//Route::group(['middleware' => ['guest', 'auth']], function () {
//    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
//});
//заработает если дороботать middlewire

//авторизованная часть
Route::group(['middleware' => ['auth']], function () {
    Route::get('/account', function () {
        return 'Account Page';
    });
});

