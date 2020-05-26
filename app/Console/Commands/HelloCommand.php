<?php

namespace App\Console\Commands;


use App\Components\HttpClient;
use Illuminate\Console\Command;


class HelloCommand extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'hello';
    
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'redis cache example';
    
    
    public function handle()
    {
        $this->info("hello");
//        $http = new HttpClient("captcha");
//        $image = "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";
//
//        $res = $http->client->post("/api/v_1/yzm.html", ['v_pic' => $image, 'v_type' => 'ne4']);
//        dd($res);
        $cookie = "JSESSIONID=1E8F501E78357FE7DDDC2B995CAC0858; Path=/gs-admin; HttpOnly";
    
        preg_match("([a-z\d]{32}|[A-Z\d]{32})", $cookie, $matches);
        dd($matches);
    }
}
