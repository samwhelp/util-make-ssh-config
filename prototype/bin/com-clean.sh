#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_VAR_DIR_PATH=$THE_BASE_DIR_PATH/../var
THE_TARGET_CONF_DIR_PATH=$THE_VAR_DIR_PATH/com # 資料夾「var/com」
THE_TARGET_CONF_FILE_PATH=$THE_TARGET_CONF_DIR_PATH/config # 檔案「var/com/config」

# 刪除「var/com」
rm $THE_TARGET_CONF_DIR_PATH -rf
