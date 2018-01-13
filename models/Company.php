<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use yii\web\UploadedFile;
/**
 * This is the model class for table "company".
 *
 * @property int $id
 * @property int $user_id
 * @property string $company_name
 * @property string $profile_description
 * @property string $establishment_date
 * @property string $company_website_url
 * @property string $company_image
 * @property string $created_at
 * @property string $updated_at
 *
 * @property User $user
 * @property Jobs[] $jobs
 */
class Company extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'company';
    }

    public function behaviors()
    {
        return [
            'timestamp' => [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => function() { 
                    return date('Y-m-d H:i:s');
                }
            ]
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_name', 'profile_description', 'establishment_date'], 'required'],
            [['user_id'], 'integer'],
            [['establishment_date', 'created_at', 'updated_at'], 'safe'],
            [['company_name'], 'string', 'max' => 255],
            [['profile_description'], 'string', 'max' => 1000],
            [['company_website_url', 'company_image'], 'string', 'max' => 500],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'user_id' => 'User ID',
            'company_name' => 'Company Name',
            'profile_description' => 'Profile Description',
            'establishment_date' => 'Establishment Date',
            'company_website_url' => 'Company Website Url',
            'company_image' => 'Company Image',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getJobs()
    {
        return $this->hasMany(Jobs::className(), ['company_id' => 'id']);
    }

    public function getImageFile() 
    {
        return isset($this->company_image) ? Yii::$app->params['upload']['cmpimage']['path'] . $this->company_image : null;
    }

    public function getImageUrl() 
    {
        // return a default image placeholder if your source avatar is not found
        $companyimg = isset($this->company_image) ? $this->company_image : 'default_user.png';
        return Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['cmpimage']['url']) . $avatar;
    }

    public function uploadImage() {
        $image = UploadedFile::getInstance($this, 'company_image');

        // if no image was uploaded abort the upload
        if (empty($image)) {
            return false;
        }

        $ext = explode(".", $image->name);
        $ext = end($ext);

        // generate a unique file name
        $this->company_image = Yii::$app->security->generateRandomString().".{$ext}";

        // the uploaded image instance
        return $image;
    }

    public function deleteImage() {
        $file = $this->getImageFile();

        // check if file exists on server
        if (empty($file) || !file_exists($file)) {
            return false;
        }

        // check if uploaded file can be deleted on server
        if (!unlink($file)) {
            return false;
        }

        // if deletion successful, reset your file attributes
        $this->company_image = null;

        return true;
    }
}
