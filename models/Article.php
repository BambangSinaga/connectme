<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\web\UploadedFile;
use yii2mod\user\models\UserModel;

/**
 * This is the model class for table "article".
 *
 * @property int $id
 * @property int $user_id
 * @property string $title
 * @property string $slug
 * @property string $preview_image
 * @property string $content
 * @property int $article_category_id
 * @property int $status
 * @property string $created_at
 * @property string $updated_at
 *
 * @property ArticleCategory $articleCategory
 * @property User $user
 */
class Article extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'article';
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
            ],
            'autouserid' => [
                'class' => BlameableBehavior::className(),
                'attributes' => [
                    \yii\db\ActiveRecord::EVENT_BEFORE_INSERT => ['user_id'],
                ],
            ],
            [
                'class' => SluggableBehavior::className(),
                'attribute' => 'title',
                'immutable' => true,
                'ensureUnique'=>true,
            ],
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'article_category_id', 'status'], 'required'],
            [['user_id', 'article_category_id', 'status'], 'integer'],
            [['content'], 'string'],
            [['created_at', 'updated_at'], 'safe'],
            [['preview_image'], 'file', 'extensions' => ['png', 'jpg', 'gif'], 'maxSize' => '100000'], //
            [['title', 'slug'], 'string', 'max' => 255],
            [['article_category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ArticleCategory::className(), 'targetAttribute' => ['article_category_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => UserModel::className(), 'targetAttribute' => ['user_id' => 'id']],
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
            'title' => 'Title',
            'slug' => 'Slug',
            'content' => 'Content',
            'preview_image' => 'Preview Image',
            'article_category_id' => 'Article Category ID',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getArticleCategory()
    {
        return $this->hasOne(ArticleCategory::className(), ['id' => 'article_category_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(UserModel::className(), ['id' => 'user_id']);
    }

    public function getImageFile() 
    {
        return isset($this->preview_image) ? Yii::$app->params['upload']['myphoto']['path'] . $this->user_id . '/' . $this->preview_image : null;
    }

    public function getImageUrl() 
    {
        // return a default image placeholder if your source avatar is not found
        $avatar = isset($this->preview_image) ? $this->preview_image : '../../default-thumb.jpg';
        return Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['myphoto']['url']). $this->user_id . '/' . $avatar;
    }

    public function uploadImage() {
        $image = UploadedFile::getInstance($this, 'preview_image');

        // if no image was uploaded abort the upload
        if (empty($image)) {
            return false;
        }

        $ext = explode(".", $image->name);
        $ext = end($ext);

        // generate a unique file name
        $this->preview_image = Yii::$app->security->generateRandomString().".{$ext}";

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
        $this->preview_image = null;

        return true;
    }
}
