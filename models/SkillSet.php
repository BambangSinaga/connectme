<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "skill_set".
 *
 * @property integer $id
 * @property string $skill_set_name
 * @property string $created_at
 * @property string $updated_at
 *
 * @property SeekerSkillSet[] $seekerSkillSets
 */
class SkillSet extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'skill_set';
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
            [['skill_set_name'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['skill_set_name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'skill_set_name' => 'Skill Set Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSeekerSkillSets()
    {
        return $this->hasMany(SeekerSkillSet::className(), ['skill_set_id' => 'id']);
    }

    public function getSkillByName($name)
    {
        $skill = SkillSet::find()->where(['skill_set_name' => $name])->one();
        if (!$skill) {
            $skill = new SkillSet();
            $skill->skill_set_name = $name;
            $skill->save(false);
        }
        return $skill;
    }
}
