<?php
/**
 * DRAIWIKI
 * Open source wiki software
 *
 * @version     1.0 Alpha 1
 * @author      Robert Monden
 * @copyright   2017-2018 DraiWiki
 * @license     Apache 2.0
 */

namespace DraiWiki\src\auth\controllers;

if (!defined('DraiWiki')) {
    header('Location: ../index.php');
    die('You\'re really not supposed to be here.');
}

use DraiWiki\src\core\controllers\Registry;

class Logout {

    public $title;

    private $_user, $_config, $_locale;

    public function __construct() {
        $this->_user = Registry::get('user');
        $this->_config = Registry::get('config');
        $this->_locale = Registry::get('locale');
    }

    public function canAccess() : bool {
        return !$this->_user->isGuest();
    }

    public function execute() : void {
        $this->_user->logout();
        $this->redirect();
    }

    public function getAppInfo() : array {
        return [
            'title' => _localized('management.logging_out')
        ];
    }

    public function getSidebarItems() : array {
        return [];
    }

    private function redirect() {
        header('Location: ' . $this->_config->read('url') . '/index.php');
        die;
    }
}