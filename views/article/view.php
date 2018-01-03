<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use yii\bootstrap\Nav;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model app\models\Article */

$this->title = $article->title;
$this->params['breadcrumbs'][] = ['label' => 'Articles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-view">

    <p>
        <?= Html::a('Update', ['update', 'id' => $article->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $article->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <div class="row">
        <div class="col-lg-9">
            <div>
                <?php
                    echo '<div>';
                    echo '<h2>'.$article->title.'</h2>';
                    echo '<p>'.substr($article->content,0,300).'...</p>';
                    echo '<p><small>articleed by '.$article->user->username.' at '.date('F j, Y, g:i a',strtotime($article->created_at)).'</small></p>';
                    echo '</div>';
                ?>
             </div>
        </div>
        <div class="col-lg-3">
            <?php
                $items=[];
                foreach($categories as $category){
                    $items[]=['label' => $category->name , 'url' => '#'];
                }
                echo Nav::widget([
                    'items' => $items,
                ]);
            ?>
        </div>
    </div>

</div>
