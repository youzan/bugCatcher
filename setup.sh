#!/usr/bin/env bash

mkdir ~/fileupload
mysql -h <mysql host> -P <mysql 端口> -u <mysql 用户名> -p<mysql 密码> < <上述pfcase-schema.sql文件的绝对路径>
