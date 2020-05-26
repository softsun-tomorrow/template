<?php

namespace App\Console;

use App\Console\Commands\AutoLoginCommand;
use App\Console\Commands\HelloCommand;
use App\Console\Commands\StatisticsEventCommand;
use App\Console\Commands\TestCommand;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        HelloCommand::class,
        AutoLoginCommand::class,
        TestCommand::class,
        StatisticsEventCommand::class,
    ];
    
    /**
     * Define the application's command schedule.
     *
     * @param \Illuminate\Console\Scheduling\Schedule $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('statistics:event')->dailyAt('23:30');
    }
    
    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');
        
        require base_path('routes/console.php');
    }
}
