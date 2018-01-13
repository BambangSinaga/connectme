<?php

use yii\helpers\Html;
//use yii\widgets\ActiveForm;
use kartik\form\ActiveForm;
use kartik\date\DatePicker;
use kartik\field\FieldRange;
use kartik\datecontrol\DateControl;
use vova07\imperavi\Widget;

/* @var $this yii\web\View */
/* @var $model app\models\Jobs */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="jobs-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'location')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'qualification')->widget(Widget::className(), [
        'settings' => [
            'minHeight' => 200,
            'plugins' => [
                'clips',
                'fullscreen'
            ]
        ]
    ]) ?>

    <?= $form->field($model, 'requirements')->widget(Widget::className(), [
        'settings' => [
            'minHeight' => 200,
            'plugins' => [
                'clips',
                'fullscreen'
            ]
        ]
    ]) ?>

    <?= $form->field($model, 'oppotunity')->widget(Widget::className(), [
        'settings' => [
            'minHeight' => 200,
            'plugins' => [
                'clips',
                'fullscreen'
            ]
        ]
    ]) ?>

    <?= $form->field($model, 'date_created')->widget(DateControl::className(), [
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

    <?= $form->field($model, 'date_closed')->widget(DateControl::className(), [
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

    <?= $form->field($model, 'show_salary')->checkbox()->label('Show Salary?') ?>

    <?php

            echo FieldRange::widget([
                'form' => $form,
                'model' => $model,
                'label' => 'Enter amount range',
                'attribute1' => 'start_salary',
                'attribute2' => 'end_salary',
                'type' => FieldRange::INPUT_SPIN,
                'widgetOptions1' => [
                    'pluginOptions' => [
                      'max' => 30000000000,
                    ],    
                ],
                'widgetOptions2' => [
                    'pluginOptions' => [
                      'max' => 30000000000,
                    ],    
                ],
            ]);
    ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
