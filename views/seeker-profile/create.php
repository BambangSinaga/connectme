<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SeekerProfile */

$this->title = "Update";
$this->params['breadcrumbs'][] = ['label' => 'Seeker Profiles', 'url' => ['view']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="seeker-profile-create">

    <?= $this->render('_form', [
        'model' => $model,
        'modelsAwards' => $modelsAwards
    ]) ?>

</div>
