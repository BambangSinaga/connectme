<?php
use yii\helpers\Html;

echo '<div class="row">';
echo '<div class="col-lg-4">';
echo Html::img($model->getImageUrl(), [
    'class'=>'img-responsive center-block', 
    'style' => 'margin:20px 0px',
    'alt'=>$model->title,
    'title'=>$model->title
]).'</div>';
echo '<div class="col-lg-8">';
echo '<h2><a href="/article/'.$model->slug.'">'.$model->title.'</a></h2>';
echo '<p>'.substr($model->content,0,300).'...</p>';
echo '<p><small class="profile-footer">written by </small>'.$model->user->username.'<small class="profile-footer"> at '.date('F j, Y, g:i a',strtotime($model->created_at)).'</small></p>';
if (Yii::$app->user->can('updateArticle', ['article' => $model])) {
    echo Html::a('<span class="glyphicon glyphicon-pencil"></span>', '/article/update/'. $model->id, ['title' => 'Update']);
}
echo '</div></div><div class="delimiter" style="margin:5px"></div>';

?>
        