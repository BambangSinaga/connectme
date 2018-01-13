<?php

namespace app\controllers;

use Yii;
use app\models\SeekerProfile;
use app\models\SeekerProfileSearch;
use app\models\Award;
use app\models\SeekerSkillSet;;
use app\models\Department;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\helpers\Json;


/**
 * SeekerProfileController implements the CRUD actions for SeekerProfile model.
 */
class SeekerProfileController extends Controller
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
     * Lists all SeekerProfile models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new SeekerProfileSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single SeekerProfile model.
     * @param integer $id
     * @return mixed
     */
    public function actionView()
    {
        if (is_null($this->findModel(Yii::$app->user->getId()))) {
            return $this->redirect(['update']);
        }
        return $this->render('view', [
            'model' => $this->findModel(Yii::$app->user->getId()),
        ]);
    }

    public function actionVisit($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new SeekerProfile model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionUpdate($id='')
    {
        $model = SeekerProfile::find()->where(['user_id' => $id != '' ? $id : Yii::$app->user->id])->one();
        $oldFile = isset($model) ? $model->getImageFile() : '';
        $oldProfileImage = isset($model) ? $model->profile_image : '';

        if(!isset($model)) {
            $model = new SeekerProfile();
            $modelsAwards = [new Award];
            $model->user_id = Yii::$app->user->getId();
            $model->seeker_name = Yii::$app->user->identity->username;
        } else {
            if (!Yii::$app->user->can('updateProfile', ['profile' => $model])) {
                \Yii::$app->getSession()->setFlash('warning', 'only update your own profile');
                return $this->redirect(Yii::$app->request->referrer ?: Yii::$app->homeUrl);
            }
            $modelsAwards = $model->awards;
        }

        if ($model->loadAll(Yii::$app->request->post())) {
            $image = $model->uploadImage();

            // revert back if no valid file instance uploaded
            if ($image === false)
                $model->profile_image = $oldProfileImage;

            if ($model->saveAll()) {
                
                $model->saveSkill($model->id, $model->skill_ids);
                if ($image !== false) {
                    @unlink($oldFile);
                    $path = $model->getImageFile();
                    $image->saveAs($path);
                }
                return $this->redirect(['view', 'id' => $model->id]);
            }
        } else {
            $model->skill_ids = ArrayHelper::map($model->skills, 'skill_set_name', 'skill_set_name');
            return $this->render('create', [
                'model' => $model,
                'modelsAwards' => (empty($modelsAwards)) ? [new Award] : $modelsAwards
            ]);
        }
    }

    public function actionGetDepartment()
    {
        $array = Department::find()->all();

        $result = ArrayHelper::map($array, 'id', 'department_name');
        echo JSON::encode($result);
    }

    /**
     * Updates an existing SeekerProfile model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    /*public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }*/

    /**
     * Deletes an existing SeekerProfile model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the SeekerProfile model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return SeekerProfile the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = SeekerProfile::find()->joinWith(['awards', 'department'])->where(['seeker_profile.user_id' => $id])->one()) !== null) {
            // var_dump($model->awards);die;
            $model->skill_ids = ArrayHelper::map($model->skills, 'skill_set_name', 'skill_set_name');
            return $model;
        }
        return null;
    }
}
