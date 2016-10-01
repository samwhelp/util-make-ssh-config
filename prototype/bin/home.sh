#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_BIN_DIR_PATH=$THE_BASE_DIR_PATH/../bin
THE_VAR_DIR_PATH=$THE_BASE_DIR_PATH/../var
THE_HOSTS_DIR_PATH=$THE_BASE_DIR_PATH/../hosts
THE_SOURCE_CONF_FILE_NAME=home.conf
THE_TARGET_CONF_DIR_PATH=$THE_VAR_DIR_PATH/home # 資料夾「var/home」
THE_TARGET_CONF_FILE_PATH=$THE_TARGET_CONF_DIR_PATH/config # 檔案「var/home/config」

# 檢查「var/home/config」這個檔案是否存在
if [ -f $THE_TARGET_CONF_FILE_PATH ]; then
	echo 'File exists:' 'var/home/config'
	echo 'Please remove it first.'
	echo 'Run'
	echo '$ make home-clean'
	echo 'Or'
	echo '$ rm var/home/config'
	exit 0
fi

# 產生資料夾「var/home」
mkdir $THE_TARGET_CONF_DIR_PATH -p

# 清空「var/home/config」
echo -n > $THE_TARGET_CONF_FILE_PATH

# 將「hosts/*/home.conf」合併到「var/home/config」
for HOST_DIR_PATH in $THE_HOSTS_DIR_PATH/* ; do
	HOST_CONF_PATH=$HOST_DIR_PATH/$THE_SOURCE_CONF_FILE_NAME
	if [ -f $HOST_CONF_PATH ]; then
		echo >> $THE_TARGET_CONF_FILE_PATH
		# echo '#' $(realpath $HOST_CONF_PATH) >> $THE_TARGET_CONF_FILE_PATH
		echo '#' $HOST_CONF_PATH >> $THE_TARGET_CONF_FILE_PATH
		cat $HOST_CONF_PATH >> $THE_TARGET_CONF_FILE_PATH
	fi
done

echo 'File created: var/home/config'
echo 'You can read it.'
echo 'Run'
echo '$ make home-read'
echo 'Or'
echo '$ less var/home/config'
