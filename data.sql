USE DraiWiki;
SET FOREIGN_KEY_CHECKS = 0;

-- DML generated by PHPMyAdmin

INSERT INTO drai_article (id, title, locale_id, `status`) VALUES (1, 'Homepage', 1, 1);

INSERT INTO drai_article_history (id, article_id, user_id, body, updated) VALUES (1, 1, NULL, '## 1. Introduction to DraiWiki\r\n### 1.1. What is DraiWiki?\r\nDraiWiki is an upcoming open source wiki software that is designed to be customizable, neat-looking, secure and easy to use.\r\n\r\n### 1.2. Why use DraiWiki?\r\nThere are other free wiki softwares out there, so you might be wondering, what makes DraiWiki the best choice for your website? Well, there are several reasons.\r\n\r\nFirst of all, the software is designed to be customizable. For example, a theme consists of three parts: images, CSS and templates. Basically, what you\'ll be able to do is this: you can use the image set from the default theme, while using the CSS of a 3rd party theme, while using the templates of yet another 3rd party theme. And the best thing is: it\'ll only take a few seconds to set up.\r\n\r\nIt also has built-in multi-language support, meaning you won\'t need an extension.\r\n\r\n## 2. Installation\r\n### 2.1. Server requirements\r\n#### 2.1.1. Minimum\r\n* PHP 7.1+\r\n* MariaDB / MySQL\r\n* PDO extension\r\n* Composer\r\n* NPM\r\n\r\n### 2.2. How to install\r\n1. Install Composer and NPM. If you\'re on a shared hosting and can\'t use the terminal, look at section 2.3\r\n2. cd to your http directory\r\n3. Run the following command in your command prompt or terminal: git clone https://github.com/Chistaen/DraiWiki.git\r\n4. Use Composer to install the required packages (composer install)\r\n5. Use NPM to install the required JS libraries (npm install)\r\n6. Edit the configuration file in public/config. Make sure you also edit the BASE_DIRNAME setting\r\n7. Run the DDL (table creation) and DML (data insertion) .sql files: ddl.sql and dml.sql.\r\n8. Enjoy!\r\n\r\n### 2.3. Troubleshooting\r\n#### 2.3.1. Help! I don\'t have access to a terminal!\r\nIf you\'re on a shared hosting that doesn\'t allow you to install Composer/NPM, don\'t worry. There\'s another solution. Just download the files to your computer and install the Composer and NPM packages from your computer\'s terminal. Then re-upload the files to your hosting. Happy writing!\r\n\r\n## 3. Open positions\r\nWe\'re always looking to expand our team. Currently, the following positions are open:\r\n* Development\r\n* Quality Assurance\r\nGo to our forum to apply:\r\nhttps://draiwiki.robertmonden.com/forum', '2017-06-16 15:20:06');

INSERT INTO drai_homepage (article_id, locale_id) VALUES (1, 1);

INSERT INTO drai_locale (id, code) VALUES (1, 'en_US');

SET FOREIGN_KEY_CHECKS = 1;