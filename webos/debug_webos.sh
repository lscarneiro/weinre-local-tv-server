#!/bin/sh
export PATH=$WEBOS_CLI_TV:$PATH

basePath="$(dirname "${BASH_SOURCE[0]}")"

source $basePath/package_webos.sh

source ./properties.sh

ares-inspect -d $WEBOS_DEVICE -a com.runner.app -o