FROM ubuntu:latest

ENV TZ=Asia/Seoul

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install git php php-gd php-xml php-curl php-mysql -y
RUN a2enmod rewrite

WORKDIR /var/www/html

RUN git clone https://github.com/rhymix/rhymix.git
RUN cd rhymix && mkdir files && chmod 777 files

RUN echo "<Directory /var/www/html>" >> /etc/apache2/apache2.conf
RUN echo "    AllowOverride All" >> /etc/apache2/apache2.conf
RUN echo "</Directory>" >> /etc/apache2/apache2.conf

CMD ["apache2ctl", "-D", "FOREGROUND"]
