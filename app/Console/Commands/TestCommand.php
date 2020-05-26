<?php

namespace App\Console\Commands;


use App\CaptchaService;
use App\Components\HttpClient;
use GuzzleHttp\Cookie\FileCookieJar;
use GuzzleHttp\Cookie\SetCookie;
use GuzzleHttp\RequestOptions;
use Illuminate\Console\Command;
use GuzzleHttp\Cookie\CookieJar;
use Illuminate\Support\Arr;
use Redmine\Client;


class TestCommand extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'test';
    
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = "test";
    
    
    public function handle()
    {
        $this->redmine();
        dd('finish');
        $http = new HttpClient("gas");
        $cookie = new FileCookieJar(storage_path("cookie/cookie.json"), false);
        $url = "/gs-admin/cgReportController.do?datagrid&configId=t_vcc_member&field=id,mobile,nick_name,state,count,create_time,last_login_time,user_id,rela_id,rela_cnt,&subs_id=";
        $data = [
            'page' => 1,
            'rows' => 10,
        ];
        $options = [
            'form_params' => $data,
            'cookies' => $cookie
        ];
        
        $res = $http->client->request($url, 'POST', $options);
        dd($res->getBody()->getContents());
        
    }

    public function redmine()
    {
        $client = new Client('https://iss.towngasvcc.com', 'joe.li', 'Lzyy5200');

//        dd($client->issue->update(29275, [
//            'status' => '开发中',
//            'due_date' => '2020-06-01',
//            'estimated_hours' => '40',
//        ]));

        $res = $client->issue->create([
            'project_id'  => 'sh_ti',
            'subject'     => '自动创建工单',
            'description' => '自动创建工单desc',
            'assigned_to_id' => '222',
            'custom_fields' => [
                [
                    'id' => 2,
                    'name' => 'Issuer',
                    'value' => 'ALL',
                ],
            ],
            'fixed_version_id' => '118'
        ]);
        dd($res);
        dd($client->issue->all(['project_id' => 'sh_ti']));
    }
    
    /**
     * 获取微秒
     *
     * @return int
     */
    public function get_total_millisecond()
    {
        $time = explode(" ", microtime());
        $time = $time [1] . ($time [0] * 1000);
        $time2 = explode(".", $time);
        $time = $time2 [0];
        
        return (int)$time;
    }
}
