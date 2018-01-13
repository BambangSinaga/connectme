<?php

use yii\helpers\Html;
use yii\widgets\ListView;
use yii\bootstrap\Nav;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ArticleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Articles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-index">

    <div class="row">
        <div class="col-lg-9">
            <?php
              echo ListView::widget([
              'dataProvider' => $dataProvider,
              'options' => [
                'tag' => 'div',
                'class' => 'list-wrapper',
                'id' => 'list-wrapper',
              ],
              'summary' => '',
              'layout' => "{items}\n{pager}",
              'itemView' => function($model, $key, $index, $widget) {
                return $this->render('_list_item',['model' => $model]);
              },
              'itemOptions' => [
                'tag' => false,
              ],
              'pager' => [
                'firstPageLabel' => 'first',
                'lastPageLabel' => 'last',
                'nextPageLabel' => 'next',
                'prevPageLabel' => 'previous',
                'maxButtonCount' => 3,
                'options' => [
                  'class' => 'pagination col-xs-12'
                ]
              ]
            ]);
            ?>
        </div>

    
        
        <div class="col-lg-3">
            <?php
                $items=[];
                foreach($categories as $category){
                    $items[]=['label' => $category->name . ' <span class="badge">'.$category->article_count.'</span>' , 'url' => ['article/category', 'id' => $category->id]];
                }
                echo Nav::widget([
                    'encodeLabels' => false,
                    'options' => ['class' => 'nav nav-pills'],
                    'items' => $items,
                ]);
            ?>
        </div>
    </div>

</div>
