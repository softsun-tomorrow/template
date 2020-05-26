<?php

namespace App\Console\Commands;


use App\CaptchaService;
use App\Components\HttpClient;
use GuzzleHttp\Cookie\FileCookieJar;
use Illuminate\Console\Command;
use GuzzleHttp\Cookie\CookieJar;
use Illuminate\Support\Arr;


class AutoLoginCommand extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'login';
    
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'auto login';
    
    
    public function handle()
    {
        $http = new HttpClient("gas");
        //获取验证码,抓取远程的图片验证码
        $time = $this->get_total_millisecond();
        $captcha_url = "/gs-admin/randCodeImage?a={$time}";
        $jar = new CookieJar(false, [
            [
                'JSESSIONID=F9337EA65CDD1B482FD70A78CC32497F; Path=/gs-admin; HttpOnly',
            ],
        ]);
        $res = $http->client->request($captcha_url, "GET", ['cookies' => $jar]);
        $cookie = $res->getHeader("Set-Cookie")[0];
        $image = $res->getBody();
        $base_image = base64_encode($image);
        //识别验证码
        $captcha_res = CaptchaService::ocr($base_image);
        if (Arr::get($captcha_res, "errCode", -1) == 0) {
            $v_code = Arr::get($captcha_res, "v_code");
            file_put_contents(storage_path("/captcha/{$v_code}.jpg"), $image);
            
        } else {
            file_put_contents(storage_path("/captcha/{$time}.jpg"), $image);
            dd(Arr::get($captcha_res, "msg"));
        }
        //自动登陆 生成cookie文件
        $login_url = "/gs-admin/loginController.do?checkuser";
        $params = [
            'userName' => '李钊',
            'password' => 'admin@123',
            'randCode' => $v_code,
            'remember' => '',
            'orgId' => '',
        ];
        $login_res = $http->client->post($login_url, $params);
        dd($login_res->getBody()->getContents());
        $login_cookie = $login_res->getHeader("Set-Cookie")[0];
        preg_match("([a-z\d]{32}|[A-Z\d]{32})", $login_cookie, $matches);
        $res_cookie = [
            [
                "Name" => "JSESSIONID",
                "Value" => $matches[0],
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => true,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "JEECGINDEXSTYLE",
                "Value" => "acele",
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "ZINDEXNUMBER",
                "Value" => 1990,
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "userName",
                "Value" => "李钊",
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "COOKIE_NAME",
                "Value" => true,
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "gr_user_id",
                "Value" => "726650b5-2373-4f91-8fed-5e4786475f1f",
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "UM_distinctid",
                "Value" => "171aae3840216b-08e3f781102cd8-30637600-13c680-171aae38403983",
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
            [
                "Name" => "CNZZDATA1272872617",
                "Value" => "60880392-1589450933-%7C1589450933",
                "Domain" => "test01.towngasvcc.com",
                "Path" => "/gs-admin",
                "HttpOnly" => false,
                "Max-Age" => 86400,
            ],
        ];
        file_put_contents(storage_path("cookie/cookie.json"), json_encode($res_cookie));
        $cookie = new FileCookieJar(storage_path("cookie/cookie.json"), true);
        dd($login_res->getStatusCode(), $cookie->toArray());
        
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
