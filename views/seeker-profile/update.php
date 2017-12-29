<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\SeekerProfile */

$this->title = 'Update Seeker Profile: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Seeker Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="seeker-profile-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
