#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

THE_BIN_DIR_PATH=$THE_BASE_DIR_PATH/../bin

THE_HOME_CLEAN_SCRIPT_PATH=$THE_BIN_DIR_PATH/home-clean.sh
THE_COM_CLEAN_SCRIPT_PATH=$THE_BIN_DIR_PATH/com-clean.sh

$THE_HOME_CLEAN_SCRIPT_PATH
$THE_COM_CLEAN_SCRIPT_PATH