<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "seeker_skill_set".
 *
 * @property int $seeker_profile_id
 * @property int $skill_set_id
 * @property string $created_at
 * @property string $updated_at
 *
 * @property SeekerProfile $seekerProfile
 * @property SkillSet $skillSet
 */
class SeekerSkillSet extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'seeker_skill_set';
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
            [['seeker_profile_id', 'skill_set_id'], 'required'],
            [['seeker_profile_id', 'skill_set_id'], 'integer'],
            [['created_at', 'updated_at'], 'safe'],
            [['seeker_profile_id', 'skill_set_id'], 'unique', 'targetAttribute' => ['seeker_profile_id', 'skill_set_id']],
            [['seeker_profile_id'], 'exist', 'skipOnError' => true, 'targetClass' => SeekerProfile::className(), 'targetAttribute' => ['seeker_profile_id' => 'id']],
            [['skill_set_id'], 'exist', 'skipOnError' => true, 'targetClass' => SkillSet::className(), 'targetAttribute' => ['skill_set_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'seeker_profile_id' => 'Seeker Profile ID',
            'skill_set_id' => 'Skill Set ID',
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSkillSet()
    {
        return $this->hasOne(SkillSet::className(), ['id' => 'skill_set_id']);
    }
}
