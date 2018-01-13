<?php

namespace app\rbac;

use yii\rbac\Rule;

/**
 * Checks if authorID matches user passed via params
 */
class AuthorRule extends Rule
{
    public $name = 'isAuthor';

    /**
     * @param string|int $user the user ID.
     * @param Item $item the role or permission that this rule is associated with
     * @param array $params parameters passed to ManagerInterface::checkAccess().
     * @return bool a value indicating whether the rule permits the role or permission it is associated with.
     */
    public function execute($user, $item, $params)
    {
        if (is_array($params) && key($params) == 'article') {
            return isset($params['article']) ? $params['article']->user_id == $user : false;
        } elseif (is_array($params) && key($params) == 'job') {
            return isset($params['job']) ? $params['job']['company']->user_id == $user : false;
        } elseif (is_array($params) && key($params) == 'company') {
            return isset($params['company']) ? $params['company']->user_id == $user : false;
        } elseif (is_array($params) && key($params) == 'profile') {
            return isset($params['profile']) ? $params['profile']->user_id == $user : false;
        }
        return false;
    }
}