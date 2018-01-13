<?php

use yii\helpers\Html;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Company */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Companies', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="company-view">
    <div class="bs-example">
        <div class="row">
            <div class="col-lg-3">
                <?= Html::img($model->getImageUrl(), [
                    'class'=>'img-responsive center-block', 
                    // 'style' => 'margin:20px 0px',
                    'alt'=>$model->company_name,
                    'title'=>$model->company_name
                ])?>
            </div>
            <div class="col-lg-9">
                <h3><strong><?= Html::encode($model->company_name) ?></strong></h3>
                <p class="profile-footer">
                    <?= Html::a(Html::encode($model->company_website_url), Url::toRoute([$model->company_website_url]), ['title' => $model->company_website_url]) ?>
                </p>
                <p><?= Html::decode($model->profile_description); ?></p>
            </div>
        </div>
    </div>
</div>