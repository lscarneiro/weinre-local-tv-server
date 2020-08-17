#!/bin/sh
export PATH=$WEBOS_CLI_TV:$PATH


source ./properties.sh

if [ $WEBOS_DEVICE = "emulator" ] 
then
    echo "add WebOS device does not work with emulator. Use with real devices only!"
    exit
fi

# Tries to remove the device first
echo "=== Device setup for $WEBOS_DEVICE"
echo "= Trying to remove $WEBOS_DEVICE"
ares-setup-device -r $WEBOS_DEVICE

# Adds the device using defined name and ip
echo "= Re-adding $WEBOS_DEVICE"
ares-setup-device -a $WEBOS_DEVICE -i "{'username':'prisoner', 'host':'$WEBOS_DEVICE_IP','port':'9922'}"

# Gets the authorization key, will prompt for the device passphrase
echo "= Getting key on $WEBOS_DEVICE"
ares-novacom -d $WEBOS_DEVICE --getkey

# Shows dev apps installed on device to check key authorization
echo "= Apps installed on $WEBOS_DEVICE"
ares-install -d $WEBOS_DEVICE --list