<?php


namespace App\Services;

use App\Components\HttpClient;
use GuzzleHttp\Cookie\FileCookieJar;
use Illuminate\Support\Facades\Log;

class HandleService
{
    const COOKIE_PATH = 'cookie/cookie.json';
    private static $retryTickets = 0;

    public static function getURI()
    {
        return config('api.gas.url');
    }


    /**
     * 获取组织列表
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getOrgList(){
        $http = new HttpClient("gas");
        //自动登陆 生成cookie文件
        $loginUrl = "/gs-admin/loginController.do?checkuser";
        $autoLogin = config('api.gas.auto_login');
        $autoLogin['orgId'] = '';
        $loginRes = $http->client->post($loginUrl, $autoLogin);
        $content = $loginRes->getBody()->getContents();
        $content = json_decode($content,true);
        if($content['msg']=='操作成功'){
            $json = $content['jsonStr']??'';
            $json = json_decode($json,true);
            return $json['attributes']['user']['userOrgList']??[];
        }
        return false;
    }

    /**
     * 批量获取气户列表
     * @param $nos
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getSubList($nos){
        $nos = explode(',',$nos);
        $nos = array_filter(array_unique($nos));
        $list = [];
        foreach ($nos as $no){
            $ret = self::getSubInfo($no);
            $list = array_merge($list,$ret);
        }
        $controlStateJson = ['A'=>'正常','L'=>'IC卡充值锁定','W'=>'缴费类业务锁定','R'=>'自报锁定'];
        $subsStateJson = ['X'=>'销户','B'=>'预销','P'=>'报停','A'=>'运行','I'=>'临时','E'=>'作废','99'=>'未知','C'=>'非激活','ENA'=>'未报装','ENI'=>'未点火'];
        $subsTypeJson = ['1'=>'民用户','2'=>'商业户','3'=>'工业户','4'=>'公福户','99'=>'未知'];
        foreach ($list as &$row){
            $row['controlStateStr'] = $controlStateJson[$row['controlState']]??$row['controlState'];
            $row['subsStateStr'] = $subsStateJson[$row['subsState']]??$row['subsState'];
            $row['subsTypeStr'] = $subsTypeJson[$row['subsType']]??$row['subsType'];
        }
        return $list;
    }

    /**
     * 获取气户信息
     *
     * @param $no
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getSubInfo($no)
    {
        $field = "id,subsId,subsCode,subsName,stenoCode,mobile,subsAddress,subsType,subsResType,managerModel,subsState,controlState";
        $result = self::postRequest(
            self::getURI()  . '/gs-admin/subsExtendsController.do?datagrid&field='.$field,
            ['subsCode' => $no]
        );
        $result = json_decode($result, true);
        if ($result && $result['total']) {
            return $result['rows'] ?? [];
        }
        return [];
    }

    /**
     * 气户锁定
     *
     * @param $list
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function lockSubs($list)
    {
        $subIds = array_column($list,'sub_id');
        $subIds = array_filter(array_unique($subIds));
        $data = [
            'ids' => implode(',',$subIds),
            'cardState' => 'L'
        ];
        $result = self::postRequest(self::getURI() . '/gs-admin/subsExtendsController.do?lockSubs', $data);
        $result = json_decode($result,true);
        if( isset($result['msg']) && strpos($result['msg'],'成功')!==FALSE){
            RedmineService::createIssue('subs_lock',$list);
        }
        return $result;
    }

    /**
     * 气户解锁
     *
     * @param $list
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function unlockSubs($list)
    {
        $subIds = array_column($list,'sub_id');
        $subIds = array_filter(array_unique($subIds));
        $data = [
            'ids' => implode(',',$subIds),
        ];
        $result = self::postRequest(self::getURI()  . '/gs-admin/subsExtendsController.do?batchA', $data);
        $result = json_decode($result,true);
        if( isset($result['msg']) && strpos($result['msg'],'成功')!==FALSE) {
            RedmineService::createIssue('subs_unlock', $list);
        }
        return $result;
    }

    /**
     * 获取IC列表
     * @param $nos
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getICList($nos){
        $nos = explode(',',$nos);
        $nos = array_filter(array_unique($nos));
        $list = [];
        foreach ($nos as $no){
            $ret = self::getICInfo($no);
            $list = array_merge($list,$ret);
        }
        $payStateJson=['I'=>'未支付','C'=>'支付成功','E'=>'退费失败','W'=>'退费中','B'=>'退费成功','X'=>'缴费失败','F'=>'线下退费','Q'=>'取消订单'];
        $transTypeJson=['1'=>'已提气','0'=>'未提气','2'=>'冻结','3'=>'已人工提气','4'=>'已退气'];
        $bizStateJson = ['G'=>'vcc异常','I'=>'未同步','O'=>'同步成功','C'=>'对账成功','E'=>'同步异常','W'=>'未对账','L'=>'待同步'];
        $transChannelJson = ['1'=>'圈存机提气','0'=>'人工提气','2'=>'小程序提气'];
        foreach ($list as &$row){
            $row['payStateStr'] = $payStateJson[$row['payState']]??$row['payState'];
            $row['transTypeStr'] = $transTypeJson[$row['transType']]??$row['transType'];
            $row['bizStateStr'] = $bizStateJson[$row['bizState']]??$row['bizState'];
            $row['transChannelStr'] = $transChannelJson[$row['transChannel']]??$row['transChannel'];
        }
        return $list;
    }

    /**
     * 获取IC信息
     * @param $no
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getICInfo($no){
        $field = 'id,createTime,payCompletedTime,code,cardNo,name,mobile,payState,transType,bizState,gasAmount,subsType,transChannel,';
        $result = self::postRequest(
            self::getURI()  . '/gs-admin/payorderController.do?datagrid&isICPay=true&isOperating=false&field='.$field,
            ['code' => $no]
        );
        $result = json_decode($result, true);
        if ($result && $result['total']) {
            return $result['rows'] ?? [];
        }
        return [];
    }

    /**
     * ic解冻
     *
     * @param $list
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function unfreezeIC($list)
    {
        $ids = array_column($list,'id');
        $ids = array_filter(array_unique($ids));
        $data = [
            'ids' => implode(',',$ids)
        ];
        $result = self::postRequest(self::getURI()  . '/gs-admin/payorderController.do?doBatchUnfreeze', $data);
        $result = json_decode($result,true);
        if( isset($result['msg']) && strpos($result['msg'],'成功')!==FALSE){
            RedmineService::createIssue('ic_unfreeze',$list);
        }
        return $result;
    }

    /**
     * 冻结IC卡
     *
     * @param $list
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function freezeIC($list)
    {
        $ids = array_column($list,'id');
        $ids = array_filter(array_unique($ids));
        $data = [
            'ids' => implode(',',$ids),
        ];
        $result = self::postRequest(self::getURI()  . '/gs-admin/payorderController.do?doBatchFreeze', $data);
        $result = json_decode($result,true);
        if( isset($result['msg']) && strpos($result['msg'],'成功')!==FALSE){
            RedmineService::createIssue('ic_freeze',$list);
        }
        return $result;
    }


    /**
     * 获取气户subid
     *
     * @param $no
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getSubID($no)
    {
        $subIds = [];
        $result = self::postRequest(
            self::getURI()  . '/gs-admin/subsExtendsController.do?datagrid&field=subsId',
            ['subsCode' => $no]
        );
        $result = json_decode($result, true);
        if ($result && $result['total']) {
            $subIds = array_column($result['rows'] ?? [], 'subsId');
        }

        return array_unique($subIds);
    }


    /**
     * 户号获取IC流水id
     *
     * @param $no
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function getICID($no)
    {
        $subIds = [];
        $result = self::postRequest(
            self::getURI()  . '/gs-admin/payorderController.do?datagrid&isICPay=true&isOperating=false&field=id',
            ['code' => $no]
        );
        $result = json_decode($result, true);
        if ($result && $result['total']) {
            $subIds = array_column($result['rows'] ?? [], 'id');
        }

        return $subIds;
    }

    /**
     * 账号登陆并记录cookie
     *
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function login()
    {
        $http = new HttpClient("gas");
        //自动登陆 生成cookie文件
        $loginUrl = "/gs-admin/loginController.do?checkuser";
        $loginRes = $http->client->post($loginUrl, config('api.gas.auto_login'));
        $loginCookie = $loginRes->getHeader('Set-Cookie')[0] ?? '';
        preg_match("([a-z\d]{32}|[A-Z\d]{32})", $loginCookie, $matches);
        $resCookie = [
            [
                "Name" => "JSESSIONID",
                "Value" => $matches[0],
                "Domain" => parse_url(config('api.gas.url'))['host'],
                "Path" => "/gs-admin",
                "HttpOnly" => true,
                "Max-Age" => 86400,
            ],
        ];
        file_put_contents(storage_path(self::COOKIE_PATH), json_encode($resCookie));

        return $resCookie;
    }

    /**
     * 港华燃气post请求，含cookie
     *
     * @param $url
     * @param $data
     * @return bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public static function postRequest($url, $data)
    {
        $http = new HttpClient("gas");
        $cookie = new FileCookieJar(storage_path(self::COOKIE_PATH), false);
        $res = $http->client->request($url, 'POST', [
            'form_params' => $data,
            'cookies' => $cookie
        ]);
        $res = $res->getBody()->getContents();
        if(json_decode($res, true) === null && self::$retryTickets < config('api.gas.retry_times', 3)){
            unset($http, $cookie);
            self::login();
            self::postRequest($url, $data);
        }

        return $res;
    }
}
