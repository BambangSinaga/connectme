<?php

namespace app\controllers;

use Yii;
use yii\web\NotFoundHttpException;

class FileController extends \yii\web\Controller
{
    /*public function actions()         
    {         
        return [         
            'connector' => array(         
                'class' => ConnectorAction::className(),         
                'settings' => array(         
                    'root' => Yii::$app->params['upload']['photo']['path'],                    
                    'URL' => Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['photo']['url']),         
                    'rootAlias' => 'Home',         
                    'mimeDetect' => 'none'         
                )                    
            ),
        ];                    
    } */
    
    public function actionDownload($filename)
    {
        $file  = Yii::$app->params['upload']['path'].'/'.$filename;
        if(empty($file) || !file_exists($file)){
            throw new NotFoundHttpException('The requested page does not exist.');
        }
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename='.basename($file));
        header('Expires: 0');
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length: ' . filesize($file));
        readfile($file);
    }
    
    public function actionImage($filename)
    {
        $file  = Yii::$app->params['upload']['path'].$filename;
        if(empty($file) || !file_exists($file)) {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
        
        $file_extension = strtolower(substr(strrchr($filename,"."),1));
        switch( $file_extension ) {
            case "gif": $ctype="image/gif"; break;
            case "png": $ctype="image/png"; break;
            case "jpeg":
            case "jpg": $ctype="image/jpg"; break;
            default:
        }

        header('Content-type: ' . $ctype);
        readfile($file);
        
    }
}
