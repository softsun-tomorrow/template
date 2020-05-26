<?php

namespace App\Console\Commands;


use App\Models\StatisticsEvent;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;


class StatisticsEventCommand extends Command
{
    /**
     * The console command name.
     *
     * @var string
     */
    protected $name = 'statistics:event';
    
    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'statistics:event';
    
    const LEVEL_COUNT = 4;//4个等级
    
    
    public function handle()
    {
        $this->info($this->description);
        $sql = "SELECT
	count( * ) AS 'cnt',
	`level`,
	DATE_FORMAT( start_time, '%Y-%m' ) AS 'month'
FROM
	`event`
GROUP BY
	DATE_FORMAT( start_time, '%Y-%m' ),
	`level` order by DATE_FORMAT( start_time, '%Y-%m' ) asc;";
        $event = DB::select($sql);
        $res = collect($event)->groupBy('month');
        $newArr = [];
        $count = self::LEVEL_COUNT;//4个等级
        foreach ($res as $key => $item) {
            $sort = $item->keyBy('level');
            $sort = json_decode(json_encode($sort), true);
            $fields = [];
            for ($i = 0; $i < $count; $i++) {
                $fields['level_' . $i] = $sort[$i]['cnt'] ?? 0;
            }
            array_push($newArr, [
                'month' => $key,
                'fields' => $fields
            ]);
        }
        foreach ($newArr as $row) {
            $month = $row['month'];
            $fields = $row['fields'];
            $count = StatisticsEvent::query()->where("month", $month)->count();
            if ($count) {
                $res = StatisticsEvent::query()
                    ->where("month", $month)
                    ->update([
                        "level_one" => $fields['level_0'],
                        "level_two" => $fields['level_1'],
                        "level_three" => $fields['level_2'],
                        "level_four" => $fields['level_3'],
                        "update_time" => time(),
                    ]);
            } else {
                $res = StatisticsEvent::query()
                    ->insert([
                        "month" => $month,
                        "level_one" => $fields['level_0'],
                        "level_two" => $fields['level_1'],
                        "level_three" => $fields['level_2'],
                        "level_four" => $fields['level_3'],
                        "create_time" => time(),
                        "update_time" => time(),
                    ]);
            }
            dump($res);
        }
        
    }
}
