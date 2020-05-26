<?php

namespace App\Admin\Controllers;

use App\Models\DutyParty;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class DutyPartyController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = '责任方';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new DutyParty());

        $grid->column('id', __('ID'))->sortable();
        $grid->column('name', __('责任方名称'));
        $grid->column('sort', __('排序'));
        $grid->column('create_time', __('创建时间'));
        $grid->column('update_time', __('更新时间'));
        //$grid->column('is_delete', __('Is delete'));
        //$grid->column('delete_time', __('Delete time'));

        $grid->filter(function ($filter) {
            // 去掉默认的id过滤器
            $filter->disableIdFilter();
            // 在这里添加字段过滤器
            $filter->like('name', '责任方名称');
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
        $show = new Show(DutyParty::findOrFail($id));

        $show->field('id', __('ID'));
        $show->field('name', __('责任方名称'));
        $show->field('sort', __('排序'));
        $show->field('create_time', __('创建时间'));
        $show->field('update_time', __('更新时间'));
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
        $form = new Form(new DutyParty());

        $form->text('name', __('责任方名称'));
        $form->text('sort', __('排序'));
        //$form->switch('is_delete', __('Is delete'));
        //$form->number('delete_time', __('Delete time'));

        return $form;
    }

    public function range()
    {
        $range = DutyParty::query()->get()->toArray();
        $rangeArr = [];
        if ($range) {
            $rangeArr = array_column($range, 'name', 'id');
        }

        return $rangeArr;
    }
}
