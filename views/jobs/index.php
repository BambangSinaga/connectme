<?php
echo \yii\widgets\ListView::widget([
  'dataProvider' => $provider,
  'itemView' => function($model)
  {
    return '
    <div class="list-group">
    <a href="http://localhost/connectme/web/company" class="list-group-item active">
    <h4 class="list-group-item-heading">'.$model->title.'</h4>
    <p class="list-group-item-text">'.$model->qualification.'</p>
    </a>
    </div>';
  }
]);
?>
