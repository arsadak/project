FROM ubuntu
MAINTAINER khan.arshadali@gmail.com
RUN apt update -y && apt install apache2 zip unzip systemctl -y
RUN service apache2 restart
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip
CMD ["/usr/sbin/apache2", "-D",  "FOREGROUND"]
