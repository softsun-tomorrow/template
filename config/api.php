<?php
return [
    'gas' => [
        'url' => env("DOMAIN_GAS"),
        'options' => [
            'exec_timeout' => env("EXEC_TIMEOUT", 3000),//ms
            'response_type' => 'raw',
            'headers' => [
                'Content-Type' => ['application/x-www-form-urlencoded; charset=UTF-8']
            ],
        ],
        'auto_login' => [
            'userName' => '李钊',
            'password' => 'admin@123',
            'randCode' => 'lubz',
            'orgId' => 'ff808081596e22f20159865735440095'
        ],
        'retry_times' => 3
    ],
    'captcha' => [
        'url' => env("DOMAIN_CAPTCHA", "http://apigateway.jianjiaoshuju.com/"),
        'options' => [
            'exec_timeout' => env("EXEC_TIMEOUT", 3000),//ms
            'query' => [],
            'response_type' => 'array',
            'headers' => [
                'appCode' => [env("CAPTCHA_APP_CODE", "A01E079A8F0E9F470569B89098E57702")],
                'appKey' => [env("CAPTCHA_APP_KEY", "AKID714db518d40f68fe83ab0055b004e60f")],
                'appSecret' => [env("CAPTCHA_APP_SECRET", "AKID714db518d40f68fe83ab0055b004e60f")],
            ],
        ],
    ]
];
