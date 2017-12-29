<?php

use yii\helpers\Html;
// use yii\widgets\ActiveForm;
use kartik\form\ActiveForm;
use kartik\field\FieldRange;
use kartik\file\FileInput;
use kartik\datecontrol\DateControl;
use wbraganca\dynamicform\DynamicFormWidget;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use app\models\SkillSet;


/* @var $this yii\web\View */
/* @var $model app\models\SeekerProfile */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="seeker-profile-form">

    <div class="row">
        <div class="col-md-9">

            <?php $form = ActiveForm::begin([
                'id' => 'dynamic-form',
                'options' => ['enctype' => 'multipart/form-data']
            ]); ?>

            <?= $form->field($model, 'seeker_name')->textInput(['maxlength' => true, 'placeholder' => 'enter your name here ...']) ?>

            <?= $form->field($model, 'short_bio')->textArea(['maxlength' => true, 'placeholder' => 'enter your short bio here ...']) ?>

            <?= $form->field($model, 'degree')->textInput(['maxlength' => true, 'placeholder' => 'enter your grade here ...']) ?>

            <?= $form->field($model, 'field_of_study')->textInput(['maxlength' => true, 'placeholder' => 'enter your field of study ...']) ?>

            <?= $form->field($model, 'grade')->textInput(['maxlength' => true, 'placeholder' => 'enter your grade here ...']) ?>

            <?= $form->field($model, 'is_active')->checkbox()->label('Still Active') ?>

            <?php
            $fromYear = range(date('Y'), 2000);
            $toYear = range(date('Y') + 4, 2003);

            echo FieldRange::widget([
                'form' => $form,
                'model' => $model,
                'label' => 'Enter start and end place',
                'attribute1' => 'from_year',
                'attribute2' => 'to_year',
                'type' => FieldRange::INPUT_DROPDOWN_LIST,
                'items1' => array_combine($fromYear, $fromYear),
                'items2' => array_combine($toYear, $toYear)
            ]);
            ?>

            
            <?= $form->field($model, 'profile_image')->widget(FileInput::classname(), [
                'options'=>[
                    'accept'=>'image/*'
                ],
                'pluginOptions'=>[
                    'allowedFileExtensions'=>['jpg','gif','png'],
                    'showUpload' => false,
            ]]); ?>

            <?= $form->field($model, 'gender')->radioList(['Male' => 'Male', 'Female' => 'Female']) ?>

            <?= $form->field($model, 'contact_number')->textInput(['maxlength' => true, 'placeholder' => 'enter your contact number here ...']) ?>

            <?= $form->field($model, 'skill_ids')->widget(Select2::className(), [
                'model' => $model,
                'attribute' => 'skill_ids',
                'data' => ArrayHelper::map(SkillSet::find()->all(), 'skill_set_name', 'skill_set_name'),
                'options' => [
                    'multiple' => true,
                ],
                'pluginOptions' => [
                    'tags' => true,
                    'tokenSeparators' => ['\n'],
                    // 'maximumInputLength' => 10
                ],
            ]); ?>


            <div class="panel panel-default">
                <div class="panel-heading"><i class="glyphicon glyphicon-envelope"></i> Awards</div>
                <div class="panel-body">
                     <?php DynamicFormWidget::begin([
                        'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                        'widgetBody' => '.container-items', // required: css class selector
                        'widgetItem' => '.item', // required: css class
                        'limit' => 4, // the maximum times, an element can be cloned (default 999)
                        'min' => 1, // 0 or 1 (default 1)
                        'insertButton' => '.add-item', // css class
                        'deleteButton' => '.remove-item', // css class
                        'model' => $modelsAwards[0],
                        'formId' => 'dynamic-form',
                        'formFields' => [
                            'full_name',
                            'address_line1',
                            'address_line2',
                            'city',
                            'state',
                            'postal_code',
                        ],
                    ]); ?>

                    <div class="container-items"><!-- widgetContainer -->
                    <?php foreach ($modelsAwards as $i => $modelAwards): ?>
                        <div class="item panel panel-default"><!-- widgetBody -->
                            <div class="panel-heading">
                                <!-- <span class="panel-title pull-left">Award</span> -->
                                <div class="pull-right">
                                    <button type="button" class="add-item btn btn-success btn-xs"><i class="glyphicon glyphicon-plus"></i></button>
                                    <button type="button" class="remove-item btn btn-danger btn-xs"><i class="glyphicon glyphicon-minus"></i></button>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="panel-body">
                                <?php
                                    // necessary for update action.
                                    if (! $modelAwards->isNewRecord) {
                                        echo Html::activeHiddenInput($modelAwards, "[{$i}]id");
                                    }
                                ?>
                                <?= $form->field($modelAwards, "[{$i}]title")->textInput(['maxlength' => true, 'placeholder' => 'enter title here ...']) ?>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <?= $form->field($modelAwards, "[{$i}]held_date")->widget(DateControl::className(), [
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
                                    </div>
                                    <div class="col-sm-6">
                                        <?= $form->field($modelAwards, "[{$i}]news_url")->textInput(['maxlength' => true, 'placeholder' => 'enter valid url here ...']) ?>
                                    </div>
                                </div><!-- .row -->
                                <?= $form->field($modelAwards, "[{$i}]description")->textArea(['rows' => '6', 'maxlength' => true, 'placeholder' => 'enter description here ...']) ?>
                                
                            </div>
                        </div>
                    <?php endforeach; ?>
                    </div>
                    <?php DynamicFormWidget::end(); ?>
                </div>
            </div>


            <div class="form-group">
                <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
        <div class="col-md-3">
            <?= Html::img($model->getImageUrl(), [
                'class'=>'img-thumbnail', 
                'alt'=>$model->seeker_name, 
                'title'=>$model->seeker_name
            ]);?>
        </div>
    </div>

</div>
