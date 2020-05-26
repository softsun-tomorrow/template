<?php
namespace App\Services;

use Illuminate\Support\Facades\Log;
use Redmine\Client;

class RedmineService{
    /**
     * 创建问题
     * @param $opType
     * @param $list
     * @return int
     */
    public static function createIssue($opType,$list){
        $config = config('redmine');
        $url = $config['url'];
        $apiKey = $config['api_key'];
        $issueParams = $config['issue'][$opType]??[];
        if(!$issueParams){
            Log::info('can not find config');
            return 0;
        }
        $nos = array_column($list, 'no');
        $nos = implode(',',$nos);
        $orgName = self::getOrgName();
        $issueParams['subject'] = str_replace('%s',$orgName.' '.$nos, $issueParams['subject']);
        if( $opType=='ic_unfreeze' || $opType=='ic_freeze' ){
            $list = collect($list)->groupBy('no')->toArray();
            $nos = [];
            foreach ($list as $key=>$item){
                $ids = array_column($item,'id');
                $nos[] = $key.'('.implode(',',$ids).')';
            }
            $nos = implode(',',$nos);
        }
        $issueParams['description'] = str_replace('%s',$orgName.' '.$nos, $issueParams['description']);
        Log::info('create issue param:'.json_encode($issueParams));
        $client = new Client($url, $apiKey);
        $res = $client->issue->create($issueParams);
        Log::info('create issue response:'.json_encode($res));
        $res = json_decode(json_encode($res),true);
        return $res["id"]??0;
    }

    /**
     * 获取组织名称
     * @return string
     */
    public static function getOrgName(){
        return '苏州港华燃气有限公司';
    }
}
