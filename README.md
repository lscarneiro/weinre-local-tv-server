# Weinre local server for TVs
Create a weinre server locally to help develop TV web apps

## Requirements

* [`npm`](https://npm.community/)
* [`docker`](https://www.docker.com/)

### Extra requirements for the TV Environments

#### webOS
* [webOS SDK](http://webostv.developer.lge.com/sdk/installation/)


## Starting the server
```shell
$ npm start
```

## Stopping the server
```shell
$ npm stop
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

## Setting up the client app

Out of the box, the app is configured to reach for a weinre server at `http://localhost:8080`.

To change this, you need to change the value of `weinreHost` and `weinrePort` accordingly to your need, both variables are defined in the `index.html` file as seening below:
```javascript
//...
var weinreHost = "localhost";
var weinrePort = "8080";
//...
```

## Deploying TV apps

### webOS
It is important to have installed the [webOS SDK](http://webostv.developer.lge.com/sdk/installation/)

Open the `webOS TV CLI` app and run: 
```shell
$ ./deploy_webos.sh
```
or:
```shell
$ npm run deploy-webos
```
The `ipk` file will be available in the `ipk_output/` directory