<?php

namespace app\controllers;

use Yii;
use yii\web\Controller;
use yii\helpers\FileHelper;


class DefaultController extends Controller
{
	public function beforeAction($action)
	{
  		$path = Yii::$app->params['upload']['myphoto']['path'] . DIRECTORY_SEPARATOR . Yii::$app->user->id;    
        if(!file_exists($path)){      
            if (!FileHelper::createDirectory($path, 0775,$recursive = true )) {
                throw new InvalidConfigException('$uploadDir does not exist and default path creation failed');
            }
        }
  
  		return parent::beforeAction($action);
	}

	public function actions()
	{
	    return [
	        'images-get' => [
	            'class' => 'vova07\imperavi\actions\GetImagesAction',
	            'url' => Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['myphoto']['url']).Yii::$app->user->id.'/', // Directory URL address, where files are stored.
	            'path' => Yii::$app->params['upload']['myphoto']['path'].Yii::$app->user->id.'/', // Or absolute path to directory where files are stored.
	        ],
	        'image-upload' => [
	            'class' => 'vova07\imperavi\actions\UploadFileAction',
	            'url' => Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['myphoto']['url']).Yii::$app->user->id.'/', // Directory URL address, where files are stored.
	            'path' => Yii::$app->params['upload']['myphoto']['path'].Yii::$app->user->id.'/', // Or absolute path to directory where files are stored.
	        ],
	        'file-delete' => [
	            'class' => 'vova07\imperavi\actions\DeleteFileAction',
	            'url' => Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['myphoto']['url']).Yii::$app->user->id.'/', // Directory URL address, where files are stored.
	            'path' => Yii::$app->params['upload']['myphoto']['path'].Yii::$app->user->id.'/', // Or absolute path to directory where files are stored.
	        ],
	    ];
	}

}