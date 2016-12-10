
THE_MAKEFILE_FILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
THE_BASE_DIR_PATH := $(abspath $(dir $(THE_MAKEFILE_FILE_PATH)))
THE_BIN_DIR_PATH := $(THE_BASE_DIR_PATH)/bin

PATH := $(THE_BIN_DIR_PATH):$(PATH)

default: help
.PHONY: default

help:
	@help.sh
.PHONY: help

clean:
	@clean.sh
.PHONY: clean

home:
	@home.sh
.PHONY: home

home-set:
	@home-set.sh
.PHONY: home-set

home-clean:
	@home-clean.sh
.PHONY: home-clean

home-read:
	@home-read.sh
.PHONY: home-read

com:
	@com.sh
.PHONY: com

com-set:
	@com-set.sh
.PHONY: com-set

com-clean:
	@com-clean.sh
.PHONY: com-clean

com-read:
	@com-read.sh
.PHONY: com-read
