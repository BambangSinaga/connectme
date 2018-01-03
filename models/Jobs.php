<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "jobs".
 *
 * @property int $id
 * @property int $company_id
 * @property string $title
 * @property string $qualification
 * @property string $requirements
 * @property string $oppotunity
 * @property string $location
 * @property string $date_created
 * @property string $date_closed
 * @property int $show_salary
 * @property string $start_salary
 * @property string $end_salary
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Company $company
 */
class Jobs extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'jobs';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['company_id', 'title', 'qualification', 'requirements', 'date_created', 'start_salary', 'end_salary', 'created_at', 'updated_at'], 'required'],
            [['company_id', 'show_salary'], 'integer'],
            [['qualification', 'requirements', 'oppotunity'], 'string'],
            [['date_created', 'date_closed', 'created_at', 'updated_at'], 'safe'],
            [['start_salary', 'end_salary'], 'number'],
            [['title'], 'string', 'max' => 100],
            [['location'], 'string', 'max' => 255],
            [['company_id'], 'exist', 'skipOnError' => true, 'targetClass' => Company::className(), 'targetAttribute' => ['company_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'company_id' => 'Company ID',
            'title' => 'Title',
            'qualification' => 'Qualification',
            'requirements' => 'Requirements',
            'oppotunity' => 'Oppotunity',
            'location' => 'Location',
            'date_created' => 'Date Created',
            'date_closed' => 'Date Closed',
            'show_salary' => 'Show Salary',
            'start_salary' => 'Start Salary',
            'end_salary' => 'End Salary',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCompany()
    {
        return $this->hasOne(Company::className(), ['id' => 'company_id']);
    }
}
