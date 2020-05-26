<?php

namespace App\Http\Controllers\Gas;

use App\Http\Controllers\Controller;
use App\Services\HandleService;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HandleController extends Controller
{
    /**
     * 获取组织信息
     * @param Request $request
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     */
    public function orgList(Request $request){
        $result = HandleService::getOrgList();
        if( $result === false ){
            return ['code'=>-1,'msg'=>'操作失败'];
        }
        return ['code'=>0,'data'=>$result,'msg'=>'操作成功'];
    }

    /**
     * 获取气户信息
     * @param Request $request
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function subList(Request $request){
        $inputs = $request->all();
        $validator = Validator::make($inputs, [
            'nos' => 'required|string',//多个逗号分隔
        ],[
            'nos.required' => '户号必填',
            'nos.string' => '户号必须是字符串'
        ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return ['code'=>0,'data'=>HandleService::getSubList($inputs['nos'])];
    }

    /**
     * 户号锁定
     * @param Request $request
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function lockSubs(Request $request)
    {
        $inputs = $request->all();
        $validator = Validator::make($inputs,  [
            'list' => 'required|array',
            'list.*.no' => 'required|string',
            'list.*.sub_id' => 'required|string'
            ],
            [
                'list.required' => '户号列表',
                'list.array' => '户号必须是数组',
                'list.*.no.required' => '户号必填',
                'list.*.no.sub_id' => 'sub id必填'
            ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return HandleService::lockSubs($inputs['list']??[]);
    }

    /**
     * 户号解锁
     * @param Request $request
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function unlockSubs(Request $request)
    {
        $inputs = $request->all();
        $validator = Validator::make($inputs,  [
                'list' => 'required|array',
                'list.*.no' => 'required|string',
                'list.*.sub_id' => 'required|string'
            ],
            [
                'list.required' => '户号列表',
                'list.array' => '户号必须是数组',
                'list.*.no.required' => '户号必填',
                'list.*.no.sub_id' => 'sub id必填'
            ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return HandleService::unlockSubs($inputs['list'] ?? []);
    }


    /**
     * 获取IC记录列表
     * @param Request $request
     * @return array
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function ICList(Request $request){
        $inputs = $request->all();
        $validator = Validator::make($inputs,[
                'nos' => 'required|string',//多个逗号分隔
            ],
            [
                'nos.required' => '户号不能为空',
                'nos.string' => '户号必须是字符串'
            ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return ['code'=>0,'data'=>HandleService::getICList($inputs['nos'])];
    }

    /**
     * 冻结IC卡
     * @param Request $request
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function freezeIC(Request $request)
    {
        $inputs = $request->all();
        $validator = Validator::make($inputs,[
                'list' => 'required|array',
                'list.*.no' => 'required|string',
                'list.*.id' => 'required|string'
            ],
            [
                'list.required' => '户号列表',
                'list.array' => '户号必须是数组',
                'list.*.no.required' => '户号必填',
                'list.*.no.id' => 'sub id必填'
            ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return HandleService::freezeIC($inputs['list'] ?? []);
    }

    /**
     * IC解冻
     * @param Request $request
     * @return array|bool|string
     * @throws \GuzzleHttp\Exception\GuzzleException
     * @throws \Illuminate\Validation\ValidationException
     */
    public function unfreezeIC(Request $request)
    {
        $inputs = $request->all();
        $validator = Validator::make($inputs,[
                'list' => 'required|array',
                'list.*.no' => 'required|string',
                'list.*.id' => 'required|string'
            ],
            [
                'list.required' => '户号列表',
                'list.array' => '户号必须是数组',
                'list.*.no.required' => '户号必填',
                'list.*.no.id' => 'sub id必填'
            ]);
        $response = $this->validateResponse($validator,$request);
        if($response){
            return $response;
        }
        return HandleService::unfreezeIC($inputs['list'] ?? []);
    }

    /**
     * 验证返回
     * @param $validator
     * @param $request
     * @return array
     */
    private function validateResponse($validator,$request){
        if ($validator->fails()) {
            $error = $validator->errors()->toArray();
            return ['code'=>-1,'msg'=>array_values($error)[0][0]??''];
        }
        return [];
    }

}
