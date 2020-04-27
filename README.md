# Local server for TV apps (with weinre)
In this repository you can find tools and tips to help you debug TV apps

## Requirements

* [`npm`](https://npm.community/)
* [`docker`](https://www.docker.com/)*

*for weinre server

## Platforms
* [WebOS](webos/README.md)
* Tizen (soon...)


---


## How-to use

### Generate your configuration file
First, you will need a `properties.sh`

To use the sample provide, just run:

```shell
npm run prepare
```

This will clone the sample `properties.sample.sh` file into your `properties.sh`

More info about the `properties.sh` at the end

## Starting the weinre server
```shell
npm start
```

## Stopping the weinre server
```shell
npm stop
```

## Setting up the server
Weinre server provides an debug client user interface URL and a target script URL on its home.
To find them, you need to open a browser and navigate to [http://localhost:8080/]().
The first link on the page is identified as `debug client user interface`, generally:
```
http://localhost:8080/client/#anonymous
```

Down the page you will find a section named `Target Script`, this is the link you should inject on the target device. Generally it is: 
```
http://localhost:8080/target/target-script-min.js#anonymous
```

### Important
> Remember: `localhost` works only for your own machine, you have to replace it with your machine's ip on the local network if you're injecting this URL on another device like a TV for example.

> Note that if you change the binding port for the docker container in the `package.json` file, this URL will still show `8080` because it is based in which port the weinre server is listening inside the docker container

### Changing the binding port
Change the `start` command in `package.json` 

The syntax for the `-p` argument for `docker run` command is: `-p <host_port>:<container_port>`, so for example: 
```
 -p 8001:8080 
```
Will make the container listen on `8001` port instead.


## Deploying TV apps

### webOS
It is important to have installed the [webOS SDK](http://webostv.developer.lge.com/sdk/installation/), more info [here](webos/README.md).

#### Runner app installation
```shell
npm run install-webos
```
#### Runner app with Chromium debugger
```shell
npm run debug-webos
```
This will deploy, install and run the app with the  chromium debugger.


---

## Configuration file

These are options for the `properties.sh` file:

`DEBUG_TYPE` - Defines if a weinre server is being used or if you're debugging directly with chromium dev tools
(options are: `direct` or `weinre`)

`WEINRE_HOST` - Defines were the weinre server is running, if you started one locally with `npm run start` then it's your machine's IP on the local network
> Only needed when `DEBUG_TYPE=weinre`

`WEINRE_PORT` - Defines the port your `WEINRE_HOST` is running, generally `8080`
> Only needed when `DEBUG_TYPE=weinre`

`WEINRE_IDENTIFIER` - This important only when using a shared weinre server
> Only needed when `DEBUG_TYPE=weinre`

`APP_HOST` - The host where the actual app is bein served, if it's running on your machine, then it's your machine's IP on the local network

`APP_PORT` - The port where the actual app is bein served generally `80`



`WEBOS_DEVICE` - The name of the "device" you're targeting at, for the webos emulator it is generally set as `emulator`. 

> You can list your webos devices using `webOS TV CLI` and running:
> ```shell
> ares-setup-device -l 
> ```

