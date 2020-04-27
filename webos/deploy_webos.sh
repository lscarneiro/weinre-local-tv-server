#!/bin/sh
export PATH=$WEBOS_CLI_TV:$PATH

source properties.sh

VARIABLES_TO_REPLACE=(APP_HOST APP_PORT WEINRE_HOST WEINRE_PORT WEINRE_IDENTIFIER)

basePath="$(dirname "${BASH_SOURCE[0]}")"

echo "=== Generating index.html..."
templateFile=$basePath/templates/$DEBUG_TYPE.html
outputfile=$basePath/src/index.html
auxfile=$basePath/src/aux.html
cp $templateFile $outputfile
for variable in "${VARIABLES_TO_REPLACE[@]}"
do
    sed "s/##$variable##/${!variable}/g" <$outputfile >$auxfile
    mv $auxfile $outputfile
done
echo "Generated with $DEBUG_TYPE template"

echo "=== Building..."
ares-package $basePath/src -o $basePath/output