<?php
/**
 * Created by PhpStorm.
 * User: will
 * Date: 2019/3/14
 * Time: 8:39 PM
 */

namespace App\Listeners;

use Illuminate\Database\Events\QueryExecuted;
use Illuminate\Support\Facades\Log;
use LightTracer\GlobalTracer;


class QueryListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    
    /**
     * Handle the event.
     *
     * @param QueryExecuted $event
     * @return void
     */
    public function handle(QueryExecuted $event)
    {
        Log::info("sql-time-used " . $event->time . " ms", [$event->sql, $event->bindings]);
    }
}
