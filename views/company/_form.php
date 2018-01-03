<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;
use kartik\date\DatePicker;
/* @var $this yii\web\View */
/* @var $model app\models\Company */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="company-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'profile_description')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'establishment_date')->widget(DatePicker::className(),[
      'value' => date('d-M-Y', strtotime('+2 days')),
      'options' => ['placeholder' => 'Select issue date ...'],
      'pluginOptions' => [
        'format' => 'dd-M-yyyy',
        'todayHighlight' => true
        ]
      ]) ?>

    <?= $form->field($model, 'company_website_url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'company_image')->widget(FileInput::classname(), [
        'options'=>[
            'accept'=>'image/*'
        ],
        'pluginOptions'=>[
            'allowedFileExtensions'=>['jpg','gif','png'],
            'showUpload' => false,
    ]]); ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
