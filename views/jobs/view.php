<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Jobs */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Jobs', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="jobs-view">
    <div class="row">
        <div class="col-lg-12">
            <div class="bs-example">
                <div class="row">
                    <div class="col-lg-1">
                        <?= Html::img($model->company->getImageUrl(), [
                            'class'=>'img-responsive center-block', 
                            // 'style' => 'margin:20px 0px',
                            'alt'=>$model->company->company_name,
                            'title'=>$model->company->company_name
                        ])?>
                    </div>
                    <div class="col-lg-10">
                        <h3><strong><?= Html::encode($model->title) ?></strong></h3>
                        <h4>
                            <?= Html::a(Html::encode($model->company->company_name), Url::toRoute(['company/visit', 'id' => $model->company->id]), ['title' => $model->company->company_name]) ?>
                        </h4>
                        <p><?= Html::encode($model->location); ?></p>
                    </div>
                    <div class="col-lg-1">
                        <?= Html::a('<h2 class="glyphicon glyphicon-user"></h2>', Url::toRoute(['seeker-profile/visit', 'id' => $model->company->user_id]), ['title' => 'See job poster']); ?>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Brief</strong></h3>
                </div>
                <div class="panel-body">
                    <p><strong>Date Created</strong>: <?= Html::decode($model->date_created); ?></p>
                    <p><strong>Date Closed</strong>: <?= Html::decode($model->date_closed); ?></p>
                    <p><strong>Salary Range</strong>: <?php
                        if ($model->show_salary) {
                          setlocale(LC_MONETARY, 'id_ID');     
                          echo money_format('%.2n', $model->start_salary) . ' - ' .money_format('%.2n', $model->end_salary);
                        } else {
                            echo "Hidden";
                        }
                      ?>
                  </p>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Qualification</strong></h3>
                </div>
                <div class="panel-body">
                    <?= Html::decode($model->qualification); ?>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Requirement</strong></h3>
                </div>
                <div class="panel-body">
                    <?= Html::decode($model->requirements); ?>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><strong>Opportunity</strong></h3>
                </div>
                <div class="panel-body">
                    <?= Html::decode($model->oppotunity); ?>
                </div>
            </div>
        </div>
    </div>

</div>
