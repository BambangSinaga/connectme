<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\SeekerProfile */

$this->title = "My Profile";//$model->id;
/*$this->params['breadcrumbs'][] = ['label' => 'Seeker Profiles', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;*/
?>
<div class="seeker-profile-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <div class="row">
        <div class="col-md-12">
            <div class="bs-example">
                <div class="row">
                    <div class="col-md-2" style="padding: 30px;">
                        <div  class="ratio img-responsive img-circle" style="background-image: url(<?= $model->getImageUrl() ?>);">
                            
                        </div>
                    </div>
                    <div class="col-md-10">
                        <h3 class="text-capitalize">
                            <strong><?= $model->seeker_name ?></strong>
                            <?= Html::a('<span class="glyphicon glyphicon-pencil"></span> Edit Profile', ['update'], ['class' => 'btn btn-default pull-right', 'style' => ['margin-right' => '15px']]) ?>
                        </h3>
                        <p><span class="glyphicon glyphicon-earphone text-danger" style="font-size: 1.2em;"></span> <?= !empty($model->contact_number) ? $model->contact_number : '<em style="color:#777;">empty</em>'; ?></p>
                        <blockquote>
                            <!-- <p class="text-justify">Short Bio</p> -->
                            <footer><?= $model->short_bio ?></footer>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="bs-example">
                <div class="row">
                    <div class="col-md-12" style="padding: 5px 30px;">
                        <h4><strong>Skills</strong></h4>
                        <?php foreach ($model->skill_ids as $skill_id) {
                            echo '<span class="label label-default" style="font-size:85%;margin-right:5px;"> '.$skill_id.' </span>';
                        } ?>
                    </div>
                </div>
                <div class="row"><div class="col-md-12"><div class="delimiter"></div></div></div>
                <div class="row">
                    <div class="col-md-12" style="padding: 5px 30px;">
                        <h4><strong>Education</strong></h4>
                        <strong class="profile-title"><?= $model->degree ?></strong><br>
                        <p class="profile-footer"><?= $model->from_year.' - '.$model->to_year ?></p>
                        <strong>Grade: </strong><span><?= !empty($model->grade) ? $model->grade : '-'  ?></span><br>
                        <strong>Field of study: </strong><span class="text-capitalize"><?= $model->field_of_study ?></span>
                    </div>
                </div>
                <div class="row"><div class="col-md-12"><div class="delimiter"></div></div></div>
                <div class="row">
                    <div class="col-md-12" style="padding: 5px 30px;">
                        <h4><strong>Awards</strong></h4>
                        <?php foreach ($model->awards as $award) {
                            echo '<address><strong class="text-capitalize">'.$award->title.'</strong><br><p class="profile-footer">'.date('d F Y', strtotime($award->held_date)).'</p><div class="row"><div class="col-md-12">'.$award->description.'</div></div><br><strong>Check these news: </strong>';
                            echo empty($award->news_url) ? '-</address><br>' : '<a href="'.$award->news_url.'">'.$award->news_url.'</a></address><br>';

                        } ?>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row"></div>

    <!-- <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'user_id',
            'seeker_name',
            'grade',
            'field_of_study',
            'from_year',
            'to_year',
            'profile_image',
            'gender',
            'is_active',
            'contact_number',
            'created_at',
            'updated_at',
        ],
    ]) ?> -->

</div>
