# Docker

## Varnish

Now Varnish does not work with HTTPS (Secure does not have chain cert?) and I don't know why therefore use HTTP.

## Preparations

### *Warning!!!*
> This paragraph is out of date since we set static IPs to app and webserver containers.

Please, run the command below before you run `docker-compose up -d`:

```bash
export DOCKER_HOST_IP=$(ip route | grep docker0 | awk '{print $9}')
```

And check if the `DOCKER_HOST_IP` contains IP-address.

Or: [stackoverflow](https://stackoverflow.com/a/45102945)
that prevents the error:

```bash
ERROR: for app  Cannot create container for service app: invalid IP address in add-host: ""
```

## How to run

Just execute:

```bash
docker-compose up -d
```

The first time execution may take a long, but it is OK, since it creates new docker image based on lumen framework.

## How to get docker container IP

```bash
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' %container_name_or_id%
```

## Afterward

Please, run the script from project root when the new container is created or the file `.env` is missing:

```bash
./docker/scripts/afterward/env.sh
```

The script creates `.env` file and some environment parameters.

### *Warning!!!*
> If you use not `bash` shell, try to run the script from `bash` only!
> If you got an error:
> ```bash
> ./docker/scripts/afterward/env.sh: command not found
> ```
> please, run the follow command:
> ```bash
> sudo chmod +x ./docker/scripts/afterward/env.sh
> ```
> from the project root and try to run the script again.
