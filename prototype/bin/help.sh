#!/usr/bin/env bash

THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

usage()
{
	echo ""
	echo "Usage: make [command]"
	echo
	cat <<EOF
Ex:

$ make home
$ make home-set
$ make home-clean
$ make home-read

$ make com
$ make com-set
$ make com-clean
$ make com-read

$ make clean

EOF
}

usage
