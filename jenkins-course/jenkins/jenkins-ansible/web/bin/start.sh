#!/bin/bash

# Starts ssh

/usr/sbin/sshd

# Starts php process in background

/opt/rh/rh-php71/root/usr/sbin/php-fpm -c /etc/php/fpm

# Starts nginx daemon

nginx -g 'daemon off;'


