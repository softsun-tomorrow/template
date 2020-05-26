<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StatisticsEvent extends Model
{
    protected $table = 'statistics_event';
    protected $guarded = [];
    /**
     * The name of the "created at" column.
     *
     * @var string
     */
    const CREATED_AT = 'create_time';

    /**
     * The name of the "updated at" column.
     *
     * @var string
     */
    const UPDATED_AT = 'update_time';
    

    public function fromDateTime($value)
    {
        return strtotime(parent::fromDateTime($value));
    }
}
