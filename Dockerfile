FROM ubuntu:15.04
MAINTAINER Pedro Cordeiro <pedro@naroga.com.br>

#Updates apt repository
RUN apt-get update -y

#Installs PHP5.6, some extensions and apcu.
RUN apt-get install -y php5 php5-mysql php5-curl php5-intl php5-memcached php5-apcu

#Installs curl, pear and wget
RUN apt-get install -y curl php-pear wget

#Installs PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar 
RUN chmod +x phpunit.phar 
RUN mv phpunit.phar /usr/local/bin/phpunit

#Installs Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

#Installs PHP CodeSniffer
RUN pear install PHP_CodeSniffer

#Fetches a sample php.ini file with most configurations already good-to-go.
RUN wget https://www.dropbox.com/s/v082gxag80neu7h/php.ini?dl=0 
RUN mv /etc/php5/cli/php.ini /etc/php5/cli/php.ini.bak 
RUN mv /etc/php5/apache2/php.ini /etc/php5/apache2/php.ini.bak 
RUN cp php.ini\?dl\=0 /etc/php5/cli/php.ini 
RUN cp php.ini\?dl\=0 /etc/php5/apache2/php.ini 

#Tests build
RUN php -v
RUN phpunit --version
RUN composer --version
RUN phpcs --version
RUN php -i | grep timezone