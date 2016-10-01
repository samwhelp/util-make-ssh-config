
THE_MAKEFILE_FILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
THE_BASE_DIR_PATH := $(abspath $(dir $(THE_MAKEFILE_FILE_PATH)))
THE_BIN_DIR_PATH := $(THE_BASE_DIR_PATH)/bin

.PHONY: usage clean home home-set home-read com com-set com-read

usage:
	@$(THE_BIN_DIR_PATH)/usage.sh

clean:
	@$(THE_BIN_DIR_PATH)/clean.sh

home:
	@$(THE_BIN_DIR_PATH)/home.sh

home-set:
	@$(THE_BIN_DIR_PATH)/home-set.sh

home-clean:
	@$(THE_BIN_DIR_PATH)/home-clean.sh

home-read:
	@$(THE_BIN_DIR_PATH)/home-read.sh

com:
	@$(THE_BIN_DIR_PATH)/com.sh

com-set:
	@$(THE_BIN_DIR_PATH)/com-set.sh

com-clean:
	@$(THE_BIN_DIR_PATH)/com-clean.sh

com-read:
	@$(THE_BIN_DIR_PATH)/com-read.sh
