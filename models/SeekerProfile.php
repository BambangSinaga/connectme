<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;
use yii\web\UploadedFile;
use cornernote\linkall\LinkAllBehavior;
use app\models\SkillSet;


/**
 * This is the model class for table "seeker_profile".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $seeker_name
 * @property string $short_bio
 * @property string $grade
 * @property string $field_of_study
 * @property string $from_year
 * @property string $to_year
 * @property string $profile_image
 * @property string $gender
 * @property integer $is_active
 * @property integer $department_id
 * @property string $contact_number
 * @property string $degree
 * @property string $created_at
 * @property string $updated_at
 *
 * @property Award[] $awards
 * @property User $user
 * @property SeekerSkillSet[] $seekerSkillSets
 */
class SeekerProfile extends \yii\db\ActiveRecord
{
    use \mootensai\relation\RelationTrait;

    public $skill_ids;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'seeker_profile';
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
            LinkAllBehavior::className(),
        ];
    }

    public function saveSkill($id, $skill_ids)
    {
        if (is_string($skill_ids)) return;
        
        $skills = [];
        foreach ($skill_ids as $skill_name) {
            $skill = SkillSet::getSkillByName($skill_name);
            if ($skill)
                $skills[] = $skill;
        }
        // var_dump($skills);die();
        $this->linkAll('skills', $skills);
    }

    public function getSkills()
    {
        return $this->hasMany(SkillSet::className(), ['id' => 'skill_set_id'])
            ->via('seekerSkillSets');
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'seeker_name', 'field_of_study', 'from_year', 'to_year', 'gender'], 'required'],
            [['user_id', 'is_active', 'department_id'], 'integer'],
            [['grade'], 'number'],
            [['profile_image', 'degree', 'created_at', 'updated_at', 'skill_ids'], 'safe'],
            [['seeker_name', 'profile_image'], 'string', 'max' => 255],
            [['short_bio'], 'string', 'max' => 250],
            [['profile_image'], 'file', 'extensions' => ['png', 'jpg', 'gif'], 'maxSize' => '100000'], // 100kb
            [['field_of_study', 'gender'], 'string', 'max' => 100],
            [['from_year', 'to_year'], 'string', 'max' => 4],
            [['contact_number'], 'string', 'max' => 20],
            [['from_year'], 'compare', 'compareAttribute' => 'to_year', 'operator' => '<=', 'skipOnEmpty' => true],
            [['to_year'], 'compare', 'compareAttribute'=>'from_year', 'operator'=>'>='],
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
            'seeker_name' => 'Seeker Name',
            'short_bio' => 'Short Bio',
            'grade' => 'Grade',
            'field_of_study' => 'Field Of Study',
            'from_year' => 'From Year',
            'to_year' => 'To Year',
            'profile_image' => 'Profile Image',
            'gender' => 'Gender',
            'is_active' => 'Is Active',
            'department_id' => 'Department Id',
            'contact_number' => 'Contact Number',
            'degree' => 'Degree',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAwards()
    {
        return $this->hasMany(Award::className(), ['seeker_profile_id' => 'id']);
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
    public function getSeekerSkillSets()
    {
        return $this->hasMany(SeekerSkillSet::className(), ['seeker_profile_id' => 'id']);
    }

    public function getImageFile() 
    {
        return isset($this->profile_image) ? Yii::$app->params['upload']['photo']['path'] . $this->profile_image : null;
    }

    public function getImageUrl() 
    {
        // return a default image placeholder if your source avatar is not found
        $avatar = isset($this->profile_image) ? $this->profile_image : 'default_user.png';
        return Yii::$app->urlManager->createUrl(Yii::$app->params['upload']['photo']['url']) . $avatar;
    }

    public function uploadImage() {
        $image = UploadedFile::getInstance($this, 'profile_image');

        // if no image was uploaded abort the upload
        if (empty($image)) {
            return false;
        }

        $ext = explode(".", $image->name);
        $ext = end($ext);

        // generate a unique file name
        $this->profile_image = Yii::$app->security->generateRandomString().".{$ext}";

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
        $this->profile_image = null;

        return true;
    }
}
