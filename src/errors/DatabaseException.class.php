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

namespace DraiWiki\src\errors;

if (!defined('DraiWiki')) {
    header('Location: ../index.php');
    die('You\'re really not supposed to be here.');
}

use DraiWiki\src\core\controllers\Registry;

class DatabaseException extends Error {

    private $_query;

    public function __construct(string $detailedInfo, ?string $query) {
        parent::__construct($detailedInfo);
        $this->_query = $query;
    }

    public function trigger() : void {
        $message = $this->generateMessage();
        echo Registry::get('gui')->parseAndGet('database_exception', $message, false);
        die;
    }

    protected function generateMessage() : array {
        return [
            'title' => $this->hasLocale ? self::$locale->read('error', 'database_exception') : 'Database exception',
            'body' => $this->hasLocale ? self::$locale->read('error', 'what_is_a_database_exception') : 'Could not successfully execute database request.',
            'detailed' => $this->canViewDetailedInfo() && $this->hasLocale ? self::$locale->read('error', 'yes_you_can') .  '<em>' . $this->detailedInfo . '</em>' : NULL,
            'query' => $this->_query,
            'backtrace' => $this->canViewDetailedInfo() ? $this->getBacktrace() : []
        ];
    }
}