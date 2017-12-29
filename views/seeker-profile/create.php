<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SeekerProfile */

$this->title = 'Create Seeker Profile';
$this->params['breadcrumbs'][] = ['label' => 'Seeker Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seeker-profile-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
        'modelsAwards' => $modelsAwards
    ]) ?>

</div>
