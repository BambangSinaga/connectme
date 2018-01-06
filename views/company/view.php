<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $model app\models\Company */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Companies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="company-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'user_id',
            'company_name',
            'profile_description',
            'establishment_date',
            'company_website_url:url',
            'company_image',
            'created_at',
            'updated_at',
        ],
    ]) ?>

    <p>
        <?= Html::a('Create Jobs', ['jobs/create', 'id' => 1], ['data-method' => 'post','class'=>'btn btn-primary']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            // 'id',
            'title',
            'location',
            'date_created',
            'date_closed',
            //'company_website_url:url',
            //'company_image',
            //'created_at',
            //'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
