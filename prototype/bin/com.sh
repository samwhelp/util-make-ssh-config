#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_BIN_DIR_PATH=$THE_BASE_DIR_PATH/../bin
THE_VAR_DIR_PATH=$THE_BASE_DIR_PATH/../var
THE_HOSTS_DIR_PATH=$THE_BASE_DIR_PATH/../hosts
THE_COMMON_DIR_PATH=$THE_BASE_DIR_PATH/../common
THE_SOURCE_CONF_FILE_NAME=com.conf
THE_SOURCE_COMMON_CONF_FILE_PATH=$THE_COMMON_DIR_PATH/$THE_SOURCE_CONF_FILE_NAME
THE_TARGET_CONF_DIR_PATH=$THE_VAR_DIR_PATH/com # 資料夾「var/com」
THE_TARGET_CONF_FILE_PATH=$THE_TARGET_CONF_DIR_PATH/config # 檔案「var/com/config」


# 檢查「var/com/config」這個檔案是否存在
if [ -f $THE_TARGET_CONF_FILE_PATH ]; then
	echo 'File exists:' 'var/com/config'
	echo 'Please remove it first.'
	echo 'Run'
	echo '$ make com-clean'
	echo 'Or'
	echo '$ rm var/com/config'
	exit 0
fi

# 產生資料夾「var/com」
mkdir $THE_TARGET_CONF_DIR_PATH -p

# 清空「var/com/config」
echo -n > $THE_TARGET_CONF_FILE_PATH

# 通用設定
if [ -f $THE_SOURCE_COMMON_CONF_FILE_PATH ]; then
	echo >> $THE_TARGET_CONF_FILE_PATH
	# echo '#' $(realpath $THE_SOURCE_COMMON_CONF_FILE_PATH) >> $THE_TARGET_CONF_FILE_PATH
	echo '#' $THE_SOURCE_COMMON_CONF_FILE_PATH >> $THE_TARGET_CONF_FILE_PATH
	cat $THE_SOURCE_COMMON_CONF_FILE_PATH >> $THE_TARGET_CONF_FILE_PATH
fi


# 將「hosts/*/com.conf」合併到「var/com/config」
for HOST_DIR_PATH in $THE_HOSTS_DIR_PATH/* ; do
	HOST_CONF_PATH=$HOST_DIR_PATH/$THE_SOURCE_CONF_FILE_NAME
	if [ -f $HOST_CONF_PATH ]; then
		echo >> $THE_TARGET_CONF_FILE_PATH
		# echo '#' $(realpath $HOST_CONF_PATH) >> $THE_TARGET_CONF_FILE_PATH
		echo '#' $HOST_CONF_PATH >> $THE_TARGET_CONF_FILE_PATH
		cat $HOST_CONF_PATH >> $THE_TARGET_CONF_FILE_PATH
	fi
done

echo 'File created: var/com/config'
echo 'You can read it.'
echo 'Run'
echo '$ make com-read'
echo 'Or'
echo '$ less var/com/config'
