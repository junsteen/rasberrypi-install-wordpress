#!/bin/bash
DOMAINDIR=/var/www
WPDIR=wordpress

#//ファイルのオーナーチェックをしないFTP無し設定ファイルの該当箇所を置き換えして上書き
REPLACETXT='define('"'"'FS_METHOD'"'"','"'"'direct'"'"');'
REPLACETXT1='false);'
sed -i s/${REPLACETXT1}/${REPLACETXT1}\\$'\n'${REPLACETXT}/g ${DOMAINDIR}/${WPDIR}/wp-config.php

#//フォルダ作成
sudo mkdir  ${DOMAINDIR}/${WPDIR}/wp-content/upgrade
sudo mkdir  ${DOMAINDIR}/${WPDIR}/wp-content/uploads

chmod 0707 -R ${DOMAINDIR}/${WPDIR}/wp-content
#sudo usermod -a -G www apache
sudo chown -R apache ${DOMAINDIR}
sudo service httpd restart
