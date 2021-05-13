# Dante server via docker

## About The Project

Dante server expose a socks proxy with authentication that can redirect https petitions. In this project are the files used for generating the dante server image available in https://hub.docker.com/repository/docker/mansoto8/dante-server

## Running the image

It can be executed via the docker-compose.yml file with the following command:

```sh
docker-compose up -d
``` 

To see the logs use:

```sh
docker-compose logs -f dante-server
``` 

The logs are also available in the host machine via a volume in the files sockd.log and sockd.errLog in the host local repo location.

The configuration file for dante server is the sockd.conf available also in the host via a volume in the host local repo location.

The default configuration ask for authentication with user/password : socks5/socks5. To test the proxy is working execute the following command in the host:

```sh
 curl --proxy 'socks5h://socks5:socks@localhost:9898' 'https://www.google.com/'
```

If for example you want to disable authentication you can go to the socksd.conf file and change the value for `socksmethod` from `username` to `none`. And then restart the service:

```sh
docker-compose restart
``` 

## Testing in Firefox

For testing the proxy with a browser I recommend using firefox and a plugin called Proxy Toggle which allows to set authentication credentials for a socks proxy. Next is the setup I used to test it:

[![Plugin screenshot][plugin-screenshot]]

[plugin-screenshot]: proxyTogglePluginSetup.png
