<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\SeekerProfile;

/**
 * SeekerProfileSearch represents the model behind the search form about `app\models\SeekerProfile`.
 */
class SeekerProfileSearch extends SeekerProfile
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'user_id', 'is_active'], 'integer'],
            [['seeker_name', 'field_of_study', 'from_year', 'to_year', 'profile_image', 'gender', 'contact_number', 'registration_date', 'created_at', 'updated_at'], 'safe'],
            [['grade'], 'number'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = SeekerProfile::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'user_id' => $this->user_id,
            'grade' => $this->grade,
            'is_active' => $this->is_active,
            'registration_date' => $this->registration_date,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'seeker_name', $this->seeker_name])
            ->andFilterWhere(['like', 'field_of_study', $this->field_of_study])
            ->andFilterWhere(['like', 'from_year', $this->from_year])
            ->andFilterWhere(['like', 'to_year', $this->to_year])
            ->andFilterWhere(['like', 'profile_image', $this->profile_image])
            ->andFilterWhere(['like', 'gender', $this->gender])
            ->andFilterWhere(['like', 'contact_number', $this->contact_number]);

        return $dataProvider;
    }
}
