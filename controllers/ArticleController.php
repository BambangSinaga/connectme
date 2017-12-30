<?php

namespace app\controllers;

use Yii;
use app\models\Article;
use app\models\ArticleSearch;
use app\models\ArticleCategory;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ArticleController implements the CRUD actions for Article model.
 */
class ArticleController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Article models.
     * @return mixed
     */
    public function actionIndex()
    {
        $articles = Article::find()
            ->where(['status' => 1])
            ->orderBy('id DESC')
            ->limit(10)
            ->all();

        $categories = ArticleCategory::find()
            ->orderBy('name ASC')
            ->all();

        return $this->render('index', [
            'articles' => $articles,
            'categories' => $categories,
        ]);
    }

    public function actionMyArticle()
    {
        $articles = Article::find()
            ->where(['status' => 1, 'user_id' => Yii::$app->user->id])
            ->orderBy('id DESC')
            ->limit(10)
            ->all();

        $categories = ArticleCategory::find()
            ->orderBy('name ASC')
            ->all();

        return $this->render('index', [
            'articles' => $articles,
            'categories' => $categories,
        ]);
    }

    public function actionPostCategory($id)
    {
        $articles = Article::find()
            ->where(['status' => 1, 'category_id' => $id])
            ->orderBy('id DESC')
            ->limit(5)
            ->all();

        $categories = ArticleCategory::find()
            ->orderBy('name ASC')
            ->all();

        return $this->render('articleCategory', [
            'articles' => $articles,
            'categories' => $categories,
        ]);
    }

    public function actionView($slug)
    {
        $categories = ArticleCategory::find()
            ->orderBy('name ASC')
            ->all();

        return $this->render('view', [
            'article' => $this->findModelBySlug($slug),
            'categories' => $categories,
        ]);
    }

    /**
     * Displays a single Article model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    /*public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }*/

    /**
     * Creates a new Article model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Article();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'slug' => $model->slug]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Article model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'slug' => $model->slug]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Article model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Article model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Article the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Article::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

    protected function findModelBySlug($slug)
    {
        if (($model = Article::find()->where(['slug' => $slug, 'status' => 1])->one()) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
