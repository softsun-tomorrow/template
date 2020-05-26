<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class EventType extends Model
{
    protected $table = 'event_type';
    protected $guarded = [];

    use SoftDeletes;
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

    /**
     * The name of the "delete at" column.
     *
     * @var string
     */
    const DELETED_AT = "delete_time";

    public function fromDateTime($value)
    {
        return strtotime(parent::fromDateTime($value));
    }
}
