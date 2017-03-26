# DraiWiki
## 1. Introduction to DraiWiki
### 1.1. What is DraiWiki?
DraiWiki is an upcoming open source wiki software that is designed to be customizable, neat-looking, secure and easy to use.

### 1.2. Why use DraiWiki?
There are other free wiki softwares out there, so you might be wondering, what makes DraiWiki the best choice for your website? Well, there are several reasons.

First of all, the software is designed to be customizable. For example, a theme consists of three parts: images, CSS and templates. Basically, what you'll be able to do is this: you can use the image set from the default theme, while using the CSS of a 3rd party theme, while using the templates of yet another 3rd party theme. And the best thing is: it'll only take a few seconds to set up.

It also has built-in multi-language support, meaning you won't need an extension.

The admin panel is designed to be self-sufficient and isolated (i.e. it has its own files), meaning that if you break something, 90% of the time you'll be able to fix it from within the admin panel. That's not all, however. The admin panel allows you to make changes without much effort.

## 2. Installation
### 2.1. Server requirements
* PHP 5.6+
* MariaDB / MySQL
* PDO extension
* Composer
* NPM

### 2.2. How to install (OUTDATED!)
1. Install Composer and NPM
2. cd to your http directory
3. Run the following command in your command prompt or terminal: git clone http://github.com/Chistaen/DraiWiki.git
4. Use Composer to install the required packages (composer install)
5. Use NPM to install the required JS libraries (npm install)
6. Edit the configuration file in public/config. Make sure you also edit the BASE_DIRNAME setting
7. Import the database tables (install.sql)
8. Enjoy!
