#!/bin/sh
ARES_EXECUTABLE=ares-package
DEFAULT_WEBOS_CLI_TV=/opt/webOS_TV_SDK/CLI/bin/

echo "=== Checking up environment..."
if ! command -v $ARES_EXECUTABLE &>/dev/null; then
  echo "$ARES_EXECUTABLE not found"
  if [ -z ${WEBOS_CLI_TV+x} ]; then
    echo "\$WEBOS_CLI_TV not set"
    if command -v $DEFAULT_WEBOS_CLI_TV/$ARES_EXECUTABLE &>/dev/null; then
      echo "Using fallback webOS TV CLI..."
      export PATH=$DEFAULT_WEBOS_CLI_TV:$PATH
    else
      echo "Cannot find webOS TV CLI, install it first!"
      exit
    fi
  else
    echo "Setting up webOS TV CLI..."
    export PATH=$WEBOS_CLI_TV:$PATH
  fi
fi
