<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use kartik\file\FileInput;
use kartik\datecontrol\DateControl;
use vova07\imperavi\Widget;
/* @var $this yii\web\View */
/* @var $model app\models\Company */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="company-form">

    <?php $form = ActiveForm::begin(['options' => ['enctype' => 'multipart/form-data']]); ?>

    <?= $form->field($model, 'company_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'profile_description')->widget(Widget::className(), [
        'settings' => [
            'minHeight' => 200,
            'plugins' => [
                'clips',
                'fullscreen'
            ]
        ]
    ]) ?>

    <?= $form->field($model, 'establishment_date')->widget(DateControl::className(), [
                                                'type'=>DateControl::FORMAT_DATE,
                                                'ajaxConversion' => true,
                                                'widgetOptions' => [
                                                    'options' => ['placeholder' => 'enter held date here ...'],
                                                    'removeButton' => false,
                                                    'pluginOptions' => [
                                                        'autoclose' => true,
                                                        'todayHighlight' => true,
                                                        'todayBtn' => true,
                                                    ]
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
