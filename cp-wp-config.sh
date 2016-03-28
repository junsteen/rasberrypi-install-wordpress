#!/bin/bash
if [ "$1" = "" ]; then
ERROR_MSG1="データベース名例：dbname"
echo ${ERROR_MSG1}
exit
fi
if [ "$2" = "" ]; then
ERROR_MSG1="ユーザー名例：dbuser"
echo ${ERROR_MSG1}
exit
fi
if [ "$3" = "" ]; then
ERROR_MSG1="DBパスワード例：dbpass"
echo ${ERROR_MSG1}
exit
fi


DOMAINDIR=/var/www
WPDIR=wordpress
#設定ファイルコピー
cp -p ${DOMAINDIR}/${WPDIR}/wp-config-sample.php ${DOMAINDIR}/${WPDIR}/wp-config.php
sudo chmod 660  ${DOMAINDIR}/${WPDIR}/wp-config.php
#設定ファイルの該当箇所を置き換えして上書き
sed -i s/database_name_here/$4/g ${DOMAINDIR}/${WPDIR}/wp-config.php
sed -i s/username_here/$2/g ${DOMAINDIR}/${WPDIR}/wp-config.php
sed -i s/password_here/$3/g ${DOMAINDIR}/${WPDIR}/wp-config.php
sed -i s/'put your unique phrase here'/$(cat /dev/urandom | tr -dc '[:alnum:]'| head -c 32)/g ${DOMAINDIR}/${WPDIR}/wp-config.php