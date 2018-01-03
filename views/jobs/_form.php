<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use kartik\form\ActiveForm;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\Jobs */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="jobs-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'company_id')->textInput() ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'qualification')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'requirements')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'oppotunity')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'date_created')->widget(DatePicker::className(),[
      'value' => date('d-M-Y', strtotime('+2 days')),
      'options' => ['placeholder' => 'Select issue date ...'],
      'pluginOptions' => [
        'format' => 'dd-M-yyyy',
        'todayHighlight' => true
        ]
      ]) ?>

    <?= $form->field($model, 'date_closed')->widget(DatePicker::className(),[
      'value' => date('d-M-Y', strtotime('+2 days')),
      'options' => ['placeholder' => 'Select issue date ...'],
      'pluginOptions' => [
        'format' => 'dd-M-yyyy',
        'todayHighlight' => true
        ]
      ]) ?>

    <?= $form->field($model, 'show_salary')->textInput() ?>

    <?= $form->field($model, 'start_salary')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'end_salary')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
