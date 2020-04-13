FROM remote-host

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN                                                                          \
  yum -y install nginx-1.12.2 openssl --enablerepo=nginx                  && \
  yum -y install https://centos7.iuscommunity.org/ius-release.rpm         && \
  yum -y install                                                             \
    rh-php71-php-fpm                                                               \
    rh-php71-php-cli                                                               \
    rh-php71-php-mysqlnd                                                           \
    rh-php71-php-soap                                                              \
    rh-php71-php-xml                                                               \
    rh-php71-php-zip                                                               \
    rh-php71-php-json                                                              \
    php-mcrypt                                                                     \
    rh-php71-php-mbstring                                                          \
    rh-php71-php-zip                                                               \
    rh-php71-php-gd                                                                \
     --enablerepo=ius && yum clean all


EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

RUN setfacl -R -m u:remote_user:rwx /var/www/html

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh

