<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="coverhome">
        <div class="grupbox">
            <div class="textgrup">
                <h1>Find The Job That Fits Your Life</h1>
                <br>
                <div class="boxtext">
                    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'jobsname') ?>
    <div class="form-group">
        <?= Html::submitButton('Submit', ['class' => 'btn btn-primary']) ?>
    </div>

<?php ActiveForm::end(); ?>
                        
                </div>
            </div>
        </div>
    </div>

    
</div>