#!/bin/bash
## wordpress settting
DLSITE=http://ja.wordpress.org
WPDIR=wordpress
DLFILE=latest-ja.tar.gz
COPYDIR=/var/www
## Wordpress GET and Expand
wget ${DLSITE}/${DLFILE} && tar -xzf ${DLFILE} -C ${COPYDIR}
