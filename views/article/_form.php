<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use app\models\ArticleCategory;
use vova07\imperavi\Widget;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Article */
/* @var $form yii\widgets\ActiveForm */

$dataCategory = ArrayHelper::map(ArticleCategory::find()->asArray()->all(), 'id', 'name');

?>

<div class="article-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true, 'placeholder' => 'write title here']) ?>

    <?= $form->field($model, 'content')->widget(Widget::className(), [
        // 'selector' => 'article-content',
        'settings' => [
            'minHeight' => 200,
            'imageUpload' => Url::to(['/default/image-upload']),
            'imageDelete' => Url::to(['/default/file-delete']),
            'imageManagerJson' => Url::to(['/default/images-get']),
            'plugins' => [
                'clips',
                'fullscreen'
            ]
        ],
        'plugins' => [
            'imagemanager' => 'vova07\imperavi\bundles\ImageManagerAsset',              
        ],
    ])?>

    <?= $form->field($model, 'article_category_id')->dropDownList($dataCategory, ['prompt' => '-Choose a Category-']) ?>

    <?= $form->field($model, 'status')->dropDownList([
        '0' => 'Draft',
        '1' => 'Publish'
    ],['prompt'=>'']) ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
