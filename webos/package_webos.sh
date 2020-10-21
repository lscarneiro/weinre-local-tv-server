#!/bin/sh

basePath="$(dirname "${BASH_SOURCE[0]}")"

source $basePath/deploy_webos.sh

echo "\n=== App instalation on $WEBOS_DEVICE"
echo "= Removing previous installed version (if exists)..."
ares-install -r com.runner.app -d $WEBOS_DEVICE

echo "= Installing new version..."
ares-install -d $WEBOS_DEVICE $basePath/output/com.runner.app_1.0.0_all.ipk
