<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\SeekerProfileSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Seeker Profiles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seeker-profile-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Seeker Profile', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'user_id',
            'seeker_name',
            'grade',
            'field_of_study',
            // 'from_year',
            // 'to_year',
            // 'profile_image',
            // 'gender',
            // 'is_active',
            // 'contact_number',
            // 'registration_date',
            // 'created_at',
            // 'updated_at',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
