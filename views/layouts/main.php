<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <?php
    NavBar::begin([
        'brandLabel' => Yii::$app->name,
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav '],
        'items' => [
            ['label' => 'Home', 'url' => ['/site/index']],
            ['label' => 'Articles', 'url' => ['/article/index']],
            ['label' => 'Jobs', 'url' => ['/jobs/index']]
        ],
    ]);
    echo Nav::widget([
        'encodeLabels' => false,
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            Yii::$app->user->isGuest ? (
                ['label' => 'Signup', 'url' => ['/site/signup']]
                ):(['label'=>'']),
            Yii::$app->user->isGuest ? (
                ['label' => 'Login', 'url' => ['/site/login']]

            ) : (
                [
                    'label' => Yii::$app->user->identity->username,
                    'items' => [
                        ['label' => '<i class="glyphicon glyphicon-user"></i> Profile', 'url' => '/seeker-profile/view'],
                        ['label' => '<i class="glyphicon glyphicon-list-alt"></i> My Articles', 'url' => '/article/my-article'],
                        ['label' => '<i class="glyphicon glyphicon-home"></i> My Companies', 'url' => '/company/my-company'],
                        ['label' => '<i class="glyphicon glyphicon-cog"></i> Reset Password', 'url' => '/site/request-password-reset'],
                        '<li>'
                        .  Html::a(
                            '<i class="glyphicon glyphicon-log-out"></i> Sign out',
                            ['/site/logout'],
                            ['data-method' => 'post','class'=>'']
                        )
                        . '</li>',
                        '<li role="separator" class="divider"></li>',
                        ['label' => '<i class="glyphicon glyphicon-edit"></i> Edit Profile', 'url' => '/seeker-profile/update'],
                        ['label' => '<i class="glyphicon glyphicon-pencil"></i> Write Articles', 'url' => '/article/create']
                    ]
                ]
            )
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>

<footer class="footer">
    <div class="container">
        <p class="pull-left">&copy; My Company <?= date('Y') ?></p>

        <p class="pull-right"><?= Yii::powered() ?></p>
    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
