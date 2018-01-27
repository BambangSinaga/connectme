<?php

namespace app\models;

use Yii;
use yii\base\Model;

class SearchForm extends Model
{
    public $jobsname;

    public function rules()
    {
        return [
            [['jobsname'], 'required'],
        ];
    }
}
?>