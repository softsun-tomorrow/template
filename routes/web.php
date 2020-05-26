<?php

use Illuminate\Routing\Router;

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
    return redirect("/admin/events");
});

Route::group(['prefix' => 'gas', 'namespace' => 'Gas'], function (Router $router){
    $router->get('org/list', 'HandleController@orgList');
    $router->get('subs/list', 'HandleController@subList');
    $router->post('subs/lock', 'HandleController@lockSubs');
    $router->post('subs/unlock', 'HandleController@unlockSubs');
    $router->get('ic/list', 'HandleController@ICList');
    $router->post('ic/freeze', 'HandleController@freezeIC');
    $router->post('ic/unfreeze', 'HandleController@unfreezeIC');
});

Route::post('/test', 'TestController@test');
