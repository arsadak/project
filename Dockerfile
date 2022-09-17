FROM ubuntu
MAINTAINER khan.arshadali@gmail.com
RUN apt update -y && apt install apache2 zip unzip systemctl -y
RUN systemctl restart apache2
ADD https://www.free-css.com/assets/files/free-css-templates/download/page283/potoub.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip potoub.zip
RUN cp -rvf potoub-html/* .
RUN rm -rf potoub-html potoub.zip
CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
