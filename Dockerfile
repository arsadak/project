FROM ubuntu
MAINTAINER khan.arshadali@gmail.com
RUN apt update -y && apt install apache2 zip unzip systemctl -y
RUN service apache2 restart
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/milina.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip milina.zip
RUN cp -rvf milina-html/* .
RUN rm -rf milina-html milina.zip
CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
