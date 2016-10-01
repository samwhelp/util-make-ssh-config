#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_VAR_DIR_PATH=$THE_BASE_DIR_PATH/../var
THE_TARGET_CONF_DIR_PATH=$THE_VAR_DIR_PATH/com # 資料夾「var/com」
THE_TARGET_CONF_FILE_PATH=$THE_TARGET_CONF_DIR_PATH/config # 檔案「var/com/config」

# 檢查「var/com/config」這個檔案是否存在
if [ ! -f $THE_TARGET_CONF_FILE_PATH ]; then
	echo 'File not exists:' 'var/com/config'
	echo 'Please create it first.'
	echo 'Run'
	echo '$ make com'
	exit 0
fi

# 使用「less」觀看「var/com/config」
less $THE_TARGET_CONF_FILE_PATH
