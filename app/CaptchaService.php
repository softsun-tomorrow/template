<?php


namespace App;


use App\Components\HttpClient;

class CaptchaService
{
    public static function ocr($image)
    {
    
        return [
            'errCode'=>0,
            'v_code'=>'88x8',
        ];
        $http = new HttpClient("captcha");
        
        $res = $http->client->post("/api/v_1/yzm.html", ['v_pic' => $image, 'v_type' => 'ne4']);
        return $res;
    }
}
