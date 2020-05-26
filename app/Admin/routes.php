<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix' => config('admin.route.prefix'),
    'namespace' => config('admin.route.namespace'),
    'middleware' => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->resource('events', EventController::class);
    $router->resource('event-ranges', EventRangeController::class);
    $router->resource('chartjs', ChartjsController::class);
    $router->resource('event-statistics', StatisticsEventController::class);
    $router->resource('event-type', EventTypeController::class);
    $router->resource('duty-party', DutyPartyController::class);

});
