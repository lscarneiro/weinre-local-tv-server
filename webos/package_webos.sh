#!/bin/sh
export PATH=$WEBOS_CLI_TV:$PATH


basePath="$(dirname "${BASH_SOURCE[0]}")"

source $basePath/deploy_webos.sh
source ./properties.sh

echo "=== App instalation on $WEBOS_DEVICE"
echo "= Removing previous installed version (if exists)..."
ares-install -r com.runner.app -d $WEBOS_DEVICE

echo "= Installing new version..."
ares-install -d $WEBOS_DEVICE $basePath/output/com.runner.app_1.0.0_all.ipk