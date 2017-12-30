<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\bootstrap\Nav;

/* @var $this yii\web\View */
/* @var $searchModel app\models\ArticleSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Articles';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="article-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Article', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <div class="row">
        <div class="col-lg-9">
            <div>
                <?php
                foreach($articles as $article){
                    echo '<div>';
                    echo '<h2>'.$article->title.'</h2>';
                    echo '<p>'.substr($article->content,0,300).'...</p>';
                    echo '<p><small>articleed by '.$article->user->username.' at '.date('F j, Y, g:i a',strtotime($article->created_at)).'</small></p>';
                    echo Html::a('<span class="glyphicon glyphicon-eye-open"></span>', $article->slug, ['title' => 'View']);
                    echo '</div>';
                }
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
