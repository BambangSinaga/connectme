<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "award".
 *
 * @property int $id
 * @property int $seeker_profile_id
 * @property string $title
 * @property string $held_date
 * @property string $news_url
 * @property string $description
 * @property string $created_at
 * @property string $updated_at
 *
 * @property SeekerProfile $seekerProfile
 */
class Award extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'award';
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
        ];
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['seeker_profile_id', 'title', 'held_date', 'description'], 'required'],
            [['seeker_profile_id'], 'integer'],
            [['held_date', 'created_at', 'updated_at'], 'safe'],
            [['description'], 'string'],
            [['news_url'], 'url', 'message' => 'no `http` or `https` found in {attribute}'],
            [['title', 'news_url'], 'string', 'max' => 255],
            [['seeker_profile_id'], 'exist', 'skipOnError' => true, 'targetClass' => SeekerProfile::className(), 'targetAttribute' => ['seeker_profile_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'seeker_profile_id' => 'Seeker Profile ID',
            'title' => 'Title',
            'held_date' => 'Held Date',
            'news_url' => 'News Url',
            'description' => 'Description',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSeekerProfile()
    {
        return $this->hasOne(SeekerProfile::className(), ['id' => 'seeker_profile_id']);
    }
}
