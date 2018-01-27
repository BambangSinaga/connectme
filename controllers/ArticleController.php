<?php

namespace app\controllers;

use Yii;
use app\models\Article;
use app\models\ArticleSearch;
use app\models\ArticleCategory;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;

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
        $dataProvider = new \yii\data\ActiveDataProvider([
          'query' => Article::find()->with('user')->where(['status' => 1])->orderBy('id DESC'),
          'pagination' => [
            'pageSize' => 10,
          ],
        ]);

        $categories = ArticleCategory::find()->joinWith('articles')
            ->addSelect(['article_category.*', 'COUNT(article.id) as article_count'])
            ->groupBy('article_category.id')
            ->having('article_count > 0')
            ->orderBy('name ASC')
            ->all();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'categories' => $categories,
        ]);
    }

    public function actionMyArticle()
    {
        $dataProvider = new \yii\data\ActiveDataProvider([
          'query' => Article::find()->with('user')->where(['status' => 1, 'user_id' => Yii::$app->user->id])->orderBy('id DESC'),
          'pagination' => [
            'pageSize' => 10,
          ],
        ]);

        $categories = ArticleCategory::find()->joinWith('articles')
            ->addSelect(['article_category.*', 'COUNT(article.id) as article_count'])
            ->groupBy('article_category.id')
            ->having('article_count > 0')
            ->orderBy('name ASC')
            ->all();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'categories' => $categories,
        ]);
    }

    public function actionCategory($id)
    {
        $dataProvider = new \yii\data\ActiveDataProvider([
          'query' => Article::find()->with('user')->where(['status' => 1, 'article_category_id' => $id])->orderBy('id DESC'),
          'pagination' => [
            'pageSize' => 10,
          ],
        ]);

        $categories = ArticleCategory::find()->joinWith('articles')
            ->addSelect(['article_category.*', 'COUNT(article.id) as article_count'])
            ->groupBy('article_category.id')
            ->having('article_count > 0')
            ->orderBy('name ASC')
            ->all();

        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'categories' => $categories,
        ]);
    }

    public function actionView($slug)
    {
        $categories = ArticleCategory::find()->joinWith('articles')
            ->addSelect(['article_category.*', 'COUNT(article.id) as article_count'])
            ->groupBy('article_category.id')
            ->having('article_count > 0')
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
        $dataCategory = ArrayHelper::map(ArticleCategory::find()->asArray()->all(), 'id', 'name');

        $oldFile = isset($model) ? $model->getImageFile() : '';
        $oldPreviewImage = isset($model) ? $model->preview_image : '';

        if ($model->load(Yii::$app->request->post())) {
            $image = $model->uploadImage();
            

            if ($image === false)
                $model->preview_image = $oldPreviewImage;

            if ($model->save()) {
                if ($image !== false) {
                    @unlink($oldFile);
                    $path = $model->getImageFile();
                    $image->saveAs($path);
                }
            }

            return $this->redirect(['view', 'slug' => $model->slug]);
        }

        return $this->render('create', [
            'model' => $model,
            'dataCategory' => $dataCategory
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

        if (!Yii::$app->user->can('updateArticle', ['article' => $model])) {
            \Yii::$app->getSession()->setFlash('warning', 'only update your own article');
            return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
        }
        
        $oldFile = isset($model) ? $model->getImageFile() : '';
        $oldPreviewImage = isset($model) ? $model->preview_image : '';

        if ($model->load(Yii::$app->request->post())) {
            $image = $model->uploadImage();
            

            if ($image === false)
                $model->preview_image = $oldPreviewImage;

            if ($model->save()) {
                if ($image !== false) {
                    @unlink($oldFile);
                    $path = $model->getImageFile();
                    $image->saveAs($path);
                }
            }
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
        $model = $this->findModel($id);
        if (!Yii::$app->user->can('updateArticle', ['article' => $model])) {
            \Yii::$app->getSession()->setFlash('warning', 'only delete your own article');
            return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
        }

        $model->delete();

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
