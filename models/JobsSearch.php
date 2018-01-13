<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Jobs;

/**
 * JobsSearch represents the model behind the search form of `app\models\Jobs`.
 */
class JobsSearch extends Jobs
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'company_id', 'show_salary'], 'integer'],
            [['title', 'qualification', 'requirements', 'oppotunity', 'location', 'date_created', 'date_closed', 'created_at', 'updated_at'], 'safe'],
            [['start_salary', 'end_salary'], 'number'],
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
    public function search($params, $query = '')
    {
        if ($query == '') {
            $query = Jobs::find();
        }

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
            'company_id' => $this->company_id,
            'date_created' => $this->date_created,
            'date_closed' => $this->date_closed,
            'show_salary' => $this->show_salary,
            'start_salary' => $this->start_salary,
            'end_salary' => $this->end_salary,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'title', $this->title])
            ->andFilterWhere(['like', 'qualification', $this->qualification])
            ->andFilterWhere(['like', 'requirements', $this->requirements])
            ->andFilterWhere(['like', 'oppotunity', $this->oppotunity])
            ->andFilterWhere(['like', 'location', $this->location]);

        return $dataProvider;
    }
}
