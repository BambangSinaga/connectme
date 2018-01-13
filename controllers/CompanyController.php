<?php

namespace app\controllers;

use Yii;
use app\models\Company;
use app\models\CompanySearch;
use app\models\JobsSearch;
use app\models\Jobs;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;
/**
 * CompanyController implements the CRUD actions for Company model.
 */
class CompanyController extends Controller
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
     * Lists all Company models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new CompanySearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionMyCompany()
    {
        $searchModel = new CompanySearch();
        $query = Company::find()->where(['user_id' => Yii::$app->user->getId()]);
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $query);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Company model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $searchModel = new JobsSearch();
        $query = Jobs::find()->where(['company_id' => $id]);
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams, $query);

        return $this->render('view', [
            'model' => $this->findModel($id),
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionVisit($id)
    {
        return $this->render('view_public', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Company model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Company();
        $model->user_id = Yii::$app->user->getId();

        if ($model->load(Yii::$app->request->post())) {
            $image = $model->uploadImage();

            if ($image === false)
                $model->company_image = null;

            if ($model->save()) {
                if ($image !== false) {
                    $path = $model->getImageFile();
                    $image->saveAs($path);
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
            \Yii::$app->getSession()->setFlash('warning', 'failed to saved!');
        }
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Company model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        if (!Yii::$app->user->can('updateCompany', ['company' => $model])) {
            \Yii::$app->getSession()->setFlash('warning', 'only update your own company');
            return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
        }

        $oldProfileImage = $model->company_image;

        if ($model->load(Yii::$app->request->post())) {
            $image = $model->uploadImage();

            if ($image === false)
                $model->company_image = $oldProfileImage;

            if ($model->save()) {
                if ($image !== false) {
                    @unlink($oldProfileImage);
                    $path = $model->getImageFile();
                    $image->saveAs($path);
                }
            }

            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Company model.
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
     * Finds the Company model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Company the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Company::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
