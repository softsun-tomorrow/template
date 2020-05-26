<?php

namespace App\Admin\Controllers;

use App\Models\StatisticsEvent;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Grid;

class StatisticsEventController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件故障统计';
    
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new StatisticsEvent());
        
        $grid->column('month', "月份");
        $grid->column('level_one', "一级故障数");
        $grid->column('level_two', "二级故障数");
        $grid->column('level_three', "三级故障数");
        $grid->column('level_four', "四级故障数");
        $grid->filter(function ($filter) {
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            $filter->removeIDFilterIfNeeded();
        });
        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->disableActions();
        
        return $grid;
    }
}
