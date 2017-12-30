<?php

return [
    'adminEmail' => 'admin@example.com',
    'user.passwordResetTokenExpire' => 3600,
    'upload' => [
        'path' => dirname(__DIR__) . '/uploads/',
        'photo' => [
            'path' => dirname(__DIR__) .'/uploads/', // used : Yii::$app->basePath . Yii::$app->params['upload']['photo']['path'];
            'url' => ['file/image','filename'=>'/'], // used : Yii::$app->basePath . Yii::$app->params['upload']['photo']['url'];
        ],
        'myphoto' => [
        	'path' => dirname(__DIR__) .'/uploads/photo/',
            'url' => ['file/image','filename'=>'/photo/'],
        ]
    ]
];
