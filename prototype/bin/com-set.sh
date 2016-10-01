#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_VAR_DIR_PATH=$THE_BASE_DIR_PATH/../var
THE_TARGET_CONF_DIR_PATH=$THE_VAR_DIR_PATH/com # 資料夾「var/com」
THE_TARGET_CONF_FILE_PATH=$THE_TARGET_CONF_DIR_PATH/config # 檔案「var/com/config」

THE_SSH_CONFIG_DIR_PATH=$HOME/.ssh
THE_SSH_CONFIG_FILE_PATH=$THE_SSH_CONFIG_DIR_PATH/config

# 檢查「var/com/config」這個檔案是否存在
if [ ! -f $THE_TARGET_CONF_FILE_PATH ]; then
	echo 'File not exists:' 'var/com/config'
	echo 'Please create it first.'
	echo 'Run'
	echo '$ make com'
	exit 0
fi

# 確保「~/.ssh」這個資料夾存在
mkdir $THE_SSH_CONFIG_DIR_PATH -p

# 檢查「~/.ssh/config」這個檔案是否存在
if [ -f $THE_SSH_CONFIG_FILE_PATH ]; then
	echo 'File exists:' $THE_SSH_CONFIG_FILE_PATH
	echo 'Please remove it first.'
	echo 'Run'
	echo '$ rm ~/.ssh/config'
	echo 'Or'
	echo '$ mv ~/.ssh/config ~/.ssh/config.bak'
	exit 0
fi

# 複製「var/com/config」到「~/.ssh/config」
cp $THE_TARGET_CONF_FILE_PATH $THE_SSH_CONFIG_FILE_PATH

echo 'Copy' 'var/com/config'
echo 'To' '~/.ssh/config'
echo 'You can read it.'
echo 'Run'
echo '$ less' '~/.ssh/config'
