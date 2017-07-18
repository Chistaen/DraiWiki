<?php
/**
 * DRAIWIKI
 * Open source wiki software
 *
 * @version     1.0 Alpha 1
 * @author      Robert Monden
 * @copyright   DraiWiki, 2017
 * @license     Apache 2.0
 */

namespace DraiWiki\src\admin\controllers;

if (!defined('DraiWiki')) {
    header('Location: ../index.php');
    die('You\'re really not supposed to be here.');
}

use DraiWiki\src\admin\models\Management as Model;
use DraiWiki\src\core\controllers\Registry;
use DraiWiki\src\main\models\AppHeader;

class Management extends AppHeader {

    private $_model, $_gui, $_route, $_currentSubApp, $_subApp;

    public function __construct() {
        $this->checkForAjax();

        $this->loadConfig();
        $this->loadUser();
        $this->_route = Registry::get('route');

        $this->_currentSubApp = $this->_route->getParams()['subapp'] ?? 'dashboard';
        $this->loadSubApp();

        // The management panel has its own sidebar
        $this->hasSidebar = false;

        $this->_gui = Registry::get('gui');

        $this->_model = new Model();
        $this->_model->generateSidebar();

        // We have our own templates
        $this->ignoreTemplates = 'both';

        // Regular permission errors don't work, so if a user doesn't have access to the management panel, just redirect to the wiki index
        if (!$this->user->hasPermission('manage_site')) {
            header('Location: ' . $this->config->read('url') . '/index.php');
            die;
        }
    }

    private function loadSubApp() : void {
        $appClass = $this->detectApp();
        $this->_subApp = new $appClass();
    }

    private function detectApp() : string {
        $apps = [
            'dashboard' => 'DraiWiki\src\admin\controllers\Dashboard',
            'users' => 'DraiWiki\src\admin\controllers\UserManagement'
        ];

        if (empty($apps[$this->_currentSubApp])) {
            $this->_currentSubApp = 'dashboard';
        }

        return $apps[$this->_currentSubApp];
    }

    public function execute() : void {
        $this->_model->setTitle($this->_subApp->getTitle());
        $this->_subApp->execute();
    }

    public function display() : void {
        /**
         * @todo Move to model
         */
        $additionalData = [
            'wiki_name' => $this->config->read('wiki_name'),
            'skin_url' => $this->_gui->getSkinUrl(),
            'image_url' => $this->_gui->getImageUrl(),
            'copyright' => $this->_gui->getCopyright(),
            'teams' => $this->_gui->getTeamMembers(),
            'packages' => $this->_gui->getLibraries(),
            'url' => $this->config->read('url'),
            'page_description' => $this->_subApp->getPageDescription()
        ];

        if (!$this->ajax) {
            echo $this->_gui->parseAndGet('admin_header', $this->_model->prepareData() + $additionalData, false);
            $this->_subApp->display();
            echo $this->_gui->parseAndGet('admin_footer', $this->_model->prepareData() + $additionalData, false);
        }

        else
            $this->_subApp->printJSON();
    }
}