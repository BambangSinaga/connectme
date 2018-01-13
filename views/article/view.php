<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\bootstrap\Nav;
use yii\helpers\Url;
use mdm\admin\components\Helper;

/* @var $this yii\web\View */
/* @var $model app\models\Article */

$this->title = $article->title;
$this->params['breadcrumbs'][] = ['label' => 'Articles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-view">

    <p>
        <?php if (Yii::$app->user->can('updateArticle', ['article' => $article])) { ?>
        <?= Html::a('Update', ['update', 'id' => $article->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $article->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
        <?php } ?>
    </p>

    <div class="row">
        <div class="col-lg-9">
                <?php
                    echo '<div>';
                    echo '<h2>'.$article->title.'</h2>';
                    echo '<p><small class="profile-footer">written by </small>'.$article->user->username.'<small class="profile-footer"> at '.date('F j, Y, g:i a',strtotime($article->created_at)).'</small></p>';
                    echo '<p>'.$article->content.'</p>';
                    echo '</div>';
                ?>
        </div>
        <div class="col-lg-3">
            <?php
                $items=[];
                foreach($categories as $category){
                    $items[]=['label' => $category->name . ' <span class="badge">'.$category->article_count.'</span>' , 'url' => ['article/category', 'id' => $category->id]];
                }
                echo Nav::widget([
                    'encodeLabels' => false,
                    'options' => ['class' => 'nav nav-pills'],
                    'items' => $items,
                ]);
            ?>
        </div>
    </div>

</div>
