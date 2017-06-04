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

namespace DraiWiki\src\main\controllers;

if (!defined('DraiWiki')) {
    header('Location: ../index.php');
    die('You\'re really not supposed to be here.');
}

use DraiWiki\src\core\controllers\Registry;
use DraiWiki\src\main\controllers\Main;
use Dwoo\Core;
use Dwoo\Data;

class GUI {

    private $_config, $_mainTemplate;
    private $_engine;
    private $_templatePath, $_skinUrl, $_imageUrl;
    private $_data;
    private $_menu;

    const DEFAULT_THEME = 'Hurricane';

    public function __construct() {
        $this->_config = Registry::get('config');
        $this->_locale = Registry::get('locale');
        $this->_engine = new Core();

        $this->_data = new Data();

        $this->setThemeInfo();
        $this->setCopyright();
        $this->generateMenu();
        $this->_engine->setTemplateDir($this->_templatePath . '/');

        // Unfortunately we can't use sprintf in templates, so we have to do this manually
        $this->_locale->replace('main', 'hello', 'Robert');

        $this->setData([
            'skin_url' => $this->_skinUrl,
            'image_url' => $this->_imageUrl,
            'locale' => $this->_locale
        ]);
    }

    public function showHeader() {
        echo $this->_engine->get('header.tpl', $this->_data);
    }

    public function showFooter() {
        echo $this->_engine->get('footer.tpl', $this->_data);
    }

    public function setData($data) {
        foreach ($data as $key => $value)
            $this->_data->assign($key, $value);
    }

    public function parseAndGet($tplName, $variables) {
        $data = new Data();
        foreach ($variables as $key => $value)
            $data->assign($key, $value);

        return $this->_engine->get($tplName . '.tpl', $data);
    }

    private function setThemeInfo() {
        if (file_exists($this->_config->read('path') . '/public/views/templates/' . $this->_config->read('templates') . '/header.tpl'))
            $this->_templatePath = $this->_config->read('path') . '/public/views/templates/' . $this->_config->read('templates');
        else if ($this->_config->read('templates') != self::DEFAULT_THEME)
            $this->_templatePath = $this->_config->read('path') . '/public/views/templates/' . self::DEFAULT_THEME;
        else
            die('Templates not found.');

        $this->_skinUrl = $this->_config->read('url') . '/stylesheet.php?id=';

        if (file_exists($this->_config->read('path') . '/public/views/images/' . $this->_config->read('images') . '/index.php'))
            $this->_imageUrl = $this->_config->read('url') . '/public/views/images/' . $this->_config->read('images');
        else if ($this->_config->read('images') != self::DEFAULT_THEME)
            $this->_imageUrl = $this->_config->read('url') . '/public/views/images/' . self::DEFAULT_THEME;
        else
            die('Skins not found.');
    }

    private function setCopyright() {
        $this->_data->assign('copyright', 'Powered by <a href="http://draiwiki.robertmonden.com" target="_blank">DraiWiki</a> ' . Main::WIKI_VERSION . ' |
            &copy; ' . date("Y") . ' <a href="http://robertmonden.com" target="_blank">Robert Monden</a>');
    }

    private function generateMenu() {
        $menu = [
            'home' => [
                'label' => 'home',
                'href' => $this->_config->read('url') . '/index.php',
                'visible' => true
            ],
            'login' => [
                'label' => 'login',
                'href' => $this->_config->read('url') . '/index.php/login',
                'visible' => true
            ],
            'register' => [
                'label' => 'register',
                'href' => $this->_config->read('url') . '/index.php/register',
                'visible' => true
            ]
        ];

        $visible_tabs = [];

        foreach ($menu as $item) {
            if ($item['visible']) {
                // Replace the label placeholders with localized labels
                $item['label'] = $this->_locale->read('main', $item['label']);
                $visible_tabs[] = $item;
            }
        }

        $this->setData(['menu' => $visible_tabs]);
    }

    public function getSkinUrl() {
        return $this->_skinUrl;
    }

    public function getImageUrl() {
        return $this->_imageUrl;
    }
}