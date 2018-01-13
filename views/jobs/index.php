<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\ListView;
/* @var $this yii\web\View */
/* @var $searchModel app\models\JobSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Jobs';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="jobs-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Jobs', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php
      echo ListView::widget([
      'dataProvider' => $dataProvider,
      'itemView' => function($model)
      {
        return '
          <div class="list-group">
          <a href="http://localhost/connectme/web/company" class="list-group-item active">
          <h4 class="list-group-item-heading">'.$model->title.'</h4>
          <style>
          th, td {
            padding: 10px;
          }
          </style>
          <table>
          <tr>
          <td> <img src="/opt/lampp/htdocs/connectme/uploads/company/TMo_gz22ojca5Ld7lbNaY0IybWsCVMja.png height="65" width="65"">
          </td>
          <td style="text-align:left">
            <p class="list-group-item-text">'.$model->qualification.'</p>
            <p class="list-group-item-text">'.$model->requirements.'</p>
          </td>
          </tr>
          </table>
          
          </a>
          </div>';
  }
]);
?>

</div>
