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

namespace DraiWiki\src\errors;

if (!defined('DraiWiki')) {
    header('Location: ../index.php');
    die('You\'re really not supposed to be here.');
}

use DraiWiki\src\core\controllers\Registry;

class CantProceedException extends Error {

    private $_message, $_locale;

    public function __construct($message) {
        $this->_message = $message;
    }

    public function trigger() : void {
        $message = $this->generateMessage();
        echo Registry::get('gui')->parseAndGet('cant_proceed_exception', $message, false);
    }

    protected function generateMessage() : array {
        return [
            'title' => _localized('error.cant_proceed_exception'),
            'body' => $this->_message
        ];
    }
}