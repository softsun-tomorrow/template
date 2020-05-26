<?php

namespace App\Admin\Controllers;

use App\Models\Event;
use App\Models\EventRange;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Facades\Auth;

class EventController extends AdminController
{
    const TYPE = [1 => '误操作', 2 => '系统故障'];
    const IS_SYNC = [0 => '否', 1 => '是'];
    const LEVEL = [1 => '一级', 2 => '二级', 3 => '三级', 4 => '四级'];
    const STATUS = [0 => '未处理', 1 => '处理中', 2 => '已恢复'];
    const RESPONSIBLE_PARTY = [1 => '系统研发部', 2 => '应用研发部', 3 => '移动研发部'];
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '事件';
    
    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Event());
        
        //$grid->hidden('id', __('ID'))->sortable();
        $grid->column('title', __('标题'))->width(200)->limit(30);
        $grid->column('type', __('事件类型'))->using(self::TYPE);
        $grid->column('level', __('等级'))->using(self::LEVEL);
        $grid->column('responsible_party', __('责任方'))->using(self::RESPONSIBLE_PARTY);
        $grid->column('improve_project', __('改进方案'))->hide();
        $grid->column('improve_time', __('改进计划时间'))->hide();
        $grid->column('is_sync', __('是否同步企业'))->using(self::IS_SYNC);
        //$grid->hidden('desc', __('描述'));
        $grid->column('range_id', __('影响范围'))->display(function ($rangId) {
            $range = EventRange::query()->find($rangId);
            if ($range) {
                return $range->name;
            }
        });
        $grid->column('start_time', __('开始时间'));
        $grid->column('end_time', __('结束时间'));
        $grid->column('status', __('处理状态'))->using(self::STATUS);
        //$grid->column('operator_id', __('操作人ID'))->hide();
        $grid->column('operator_name', __('操作人名称'));
        $grid->column('create_time', __('创建时间'))->date('Y-m-d H:i:s');
        //$grid->hidden('update_time', __('编辑时间'))->date('Y-m-d H:i:s');
        //$grid->column('is_delete', __('Is delete'));
        //$grid->column('delete_time', __('Delete time'));
        
        $grid->filter(function ($filter) {
            
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            
            // 在这里添加字段过滤器
            $filter->like('title', '标题');
            $filter->equal('level', '等级')->radio(array_merge(['' => '全部'], self::LEVEL));
            $filter->equal('range_id', '影响范围')->select(function () {
                $range = EventRange::query()->get()->toArray();
                if ($range) {
                    return array_column($range, 'name', 'id');
                }
            });
            $filter->equal('status', '处理状态')->radio(array_merge(['' => '全部'], self::STATUS));
            $filter->between('start_time', '开始时间')->datetime();
            $filter->between('end_time', '结束时间')->datetime();
            $filter->between('create_time', '创建时间')->datetime();
        });
        
        return $grid;
    }
    
    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Event::findOrFail($id));
        $show->field('id', __('ID'));
        $show->field('title', __('标题'));
        $show->field('level', __('等级'))->using(self::LEVEL);
        $show->field('type', __('事件类型'))->using(self::TYPE);
        $show->field('responsible_party', __('责任方'))->using(self::RESPONSIBLE_PARTY);
        $show->field('improve_project', __('改进方案'));
        $show->field('improve_time', __('改进计划时间'));
        $show->field('is_sync', __('是否同步企业'))->using(self::IS_SYNC);
        $show->field('range_id', __('影响范围'))->as(function ($rangId) {
            $range = EventRange::query()->find($rangId);
            if ($range) {
                return $range->name;
            }
        });
        $show->field('start_time', __('开始时间'));
        $show->field('end_time', __('结束时间'));
        $show->field('status', __('处理状态'))->using(self::STATUS);
        $show->field('desc', __('描述'));
        $show->field('operator_id', __('操作人ID'));
        $show->field('operator_name', __('操作人名称'));
        $show->field('create_time', __('创建时间'))->date('Y-m-d H:i:s');
        $show->field('update_time', __('编辑时间'))->date('Y-m-d H:i:s');
        //$show->field('is_delete', __('Is delete'));
        //$show->field('delete_time', __('Delete time'));
        
        return $show;
    }
    
    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Event());
        $user = Auth::guard('admin')->user();
        $form->text('title', __('标题'));
        $form->radio('level', '等级')->options(self::LEVEL)->default(3);
        $form->radio('status', '处理状态')->options(self::STATUS)->default(0);
        $form->select('range_id', '影响范围')->options(function () {
            $range = EventRange::query()->get()->toArray();
            if ($range) {
                return array_column($range, 'name', 'id');
            }
        });
        $form->radio('type', __('事件类型'))->options(self::TYPE)->default(1);
        $form->radio('is_sync', __('是否同步企业'))->options(self::IS_SYNC)->default(0);
        $form->select('responsible_party', __('责任方'))->options(self::RESPONSIBLE_PARTY);
        
        $form->datetime('start_time', '故障开始时间')->format('YYYY-MM-DD HH:mm:ss');
        $form->datetime('end_time', '故障结束时间')->format('YYYY-MM-DD HH:mm:ss');
        $form->textarea('desc', __('故障描述'));
        $form->hidden('operator_id', __('操作人ID'))->value($user->id);
        $form->hidden('operator_name', __('操作人名称'))->value($user->name);
        $form->text('improve_project', __('改进方案'));
        $form->datetime('improve_time', __('改进计划时间'));
        $form->textarea('memo', "备注");
        
        return $form;
    }
}
