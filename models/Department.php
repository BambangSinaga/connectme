<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "department".
 *
 * @property int $id
 * @property string $department_name
 * @property string $created_at
 * @property string $updated_at
 *
 * @property SeekerProfile[] $seekerProfiles
 */
class Department extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'department';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['department_name'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['department_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'department_name' => 'Department Name',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSeekerProfiles()
    {
        return $this->hasMany(SeekerProfile::className(), ['department_id' => 'id']);
    }
}
