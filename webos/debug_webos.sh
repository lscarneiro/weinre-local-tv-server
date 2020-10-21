#!/bin/sh

basePath="$(dirname "${BASH_SOURCE[0]}")"

source $basePath/package_webos.sh

echo "\n=== Time to play, lets debug!"
echo "= Starting debug session (Open the url on a Chrome/Chromium version v68 or older)"
ares-inspect -d $WEBOS_DEVICE -a com.runner.app
