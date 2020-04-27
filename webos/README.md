# WebOS setup details

## Relevant doc links
[webOS SDK installation](http://webostv.developer.lge.com/sdk/installation/)

[webOS App Testing](http://webostv.developer.lge.com/develop/app-test/#extendingDevModeTime)

[webOS CLI docs](http://webostv.developer.lge.com/sdk/tools/using-webos-tv-cli/?wos_flag=ares-inspect#ares-inspect)

[webOS Build your first app](http://webostv.developer.lge.com/develop/building-your-first-web-app-webos-tv/)

[webOS Deploying apps](http://webostv.developer.lge.com/sdk/tools/using-webos-tv-cli/testing-web-app-cli/)

[webOS Debugging with inspectors](http://webostv.developer.lge.com/sdk/tools/ide/debugging-your-app-inspectors/)

## Setup real device

Search TV on network
```shell
ares-setup-device -s
```

Important TV info when setting up:
```shell
Device Port: 9922
ssh user: prisoner
authentification: password
password: <LEAVE EMPTY!!!!>

<TV_NAME> prisoner@<TV_IP>:9922 ssh tv
```

Get Key from TV
```shell
ares-novacom --device <TV_NAME> --getkey
```

Check if TV is ready for app install
```shell
ares-install --device <TV_NAME> --list
```

> TIP: Don't forget to also set the `<TV_NAME>` value you used in this setup process in the `properties.sh` file as the `WEBOS_DEVICE` parameter.


List your set-up devices:
```shell
ares-setup-device -l 
```

## Generating the IPK file

```shell
npm run deploy-webos
```

The `ipk` file will be available in the `output/` directory