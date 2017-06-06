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

namespace DraiWiki\src\main\models;

if (!defined('DraiWiki')) {
	header('Location: ../index.php');
	die('You\'re really not supposed to be here.');
}

use DraiWiki\Config;

class Stylesheet {

	private $_config, $_filename;

    public function __construct($filename) {
        $this->_config = new Config();
        $this->_filename = $filename;
    }

	public function parse() : string {
		if (!$this->doesExist())
			return '-1';

		header('Content-type: text/css');
		
		if ($stylesheet = file_get_contents($this->generatePath())) {
			$this->applyImageUrl($stylesheet);
			return $stylesheet;
		}

		else
			return '-1';
	}

	private function applyImageUrl(&$stylesheet) : void {
		$stylesheet = str_replace('{IMAGE_URL}', $this->generateImageUrl(), $stylesheet);
	}

	private function generateImageUrl() : string {
		return $this->_config->read('url') . '/public/views/images/' . $this->_config->read('images') . '/';
	}

	private function generatePath() : string {
		return $this->_config->read('path') . '/public/views/skins/' . $this->_config->read('skins') . '/' . $this->_filename . '.css';
	}

	private function doesExist() : bool {
		return file_exists($this->generatePath());
	}
}
