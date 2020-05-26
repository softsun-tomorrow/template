<?php


namespace App\Components;


use Overtrue\Http\Client;
use Overtrue\Http\Config;

class HttpClient
{
    /** @var Client */
    public $client;
    public $prefix;
    public $config;

    /**
     * ProxyHttpService constructor.
     * @param $prefix
     */
    public function __construct($prefix)
    {
        $this->prefix = $prefix;
        $this->config = $this->getConfig();
        $this->client = app("http.client.{$this->prefix}");
        $this->client->setConfig(new Config(
            [
                'base_uri' => $this->config['url'],
                'timeout' => $this->config['options']['exec_timeout'],
                'headers' => $this->config['options']['headers'],
                'response_type' => $this->config['options']['response_type'],
                'debug' =>false,
            ]
        ));
    }

    private function getConfig()
    {
        $config = config("api.{$this->prefix}");

        return $config;
    }



}
