<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Overtrue\Http\Client;

class HttpServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //绑定http.client
        $this->app->singleton("http.client.gas", function () {
            $client = new Client();
            
            return $client;
        });
        
        $this->app->singleton("http.client.captcha", function () {
            $client = new Client();
            
            return $client;
        });
    }
    
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
    
    }
}
