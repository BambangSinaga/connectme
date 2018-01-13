<?php

use yii\helpers\Html;
use yii\widgets\ListView;
/* @var $this yii\web\View */
/* @var $searchModel app\models\JobSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Jobs';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="jobs-index">

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
