<?php
// _list_item.php
use yii\helpers\Html;
use yii\helpers\Url;
?>

<div class="bs-example">
<div class="row">
  <div class="col-lg-12">
    <div class="row">
      <div class="col-lg-2">
        <?= Html::img($model->company->getImageUrl(), [
                        'class'=>'img-responsive center-block', 
                        // 'style' => 'margin:20px 0px',
                        'alt'=>$model->company->company_name,
                        'title'=>$model->company->company_name
                    ])?>
      </div>
      <div class="col-lg-10">
        <h3 class="title">
          <?= Html::a(Html::encode($model->title), Url::toRoute(['jobs/view', 'id' => $model->id]), ['title' => $model->title]) ?>
      </h3>
      <h5>
        <?= Html::a(Html::encode($model->company->company_name), Url::toRoute(['company/visit', 'id' => $model->company->id]), ['title' => $model->company->company_name]) ?>
      </h5>
      <p class="profile-footer"><?= Html::encode($model->location); ?></p>
      <p><?php
        if ($model->show_salary) {
          setlocale(LC_MONETARY, 'id_ID');     
          echo money_format('%.2n', $model->start_salary) . ' - ' .money_format('%.2n', $model->end_salary);
        }
      ?></p>
      </div>
    </div>
  </div>
</div>
</div>