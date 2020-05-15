FROM ubuntu:18.04
FROM php:7.2.1-apache
MAINTAINER Donald Nyemba
RUN apt-get update && \
 apt-get -y install apache2
# Create a PHP file in the Apache document root I
RUN echo '<?php phpinfo(); ?>' > /var/www/html/infophp.php
RUN echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
#Install apache and write hello world message
RUN echo 'Hello World!' > /var/www/html/index.html

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /root/run_apache.sh

