# docker-snap

![](https://github.com/snap-contrib/docker-snap/workflows/Docker/badge.svg)

This is a basic image with SNAP and snappy.

You may evolve it to include additional conda packages by editing the `environment.yml` file and rebuilding the image.

## Pulling this docker image

This docker image is published on Github Packages. 

If you don't have a Personal Access Token with `read:packages` set, create a new one at: https://github.com/settings/tokens/new

Log on the docker repository with:

```console
docker login docker.pkg.github.com --username <your_user_name> --password <generated_token_not_password>
```

The pull the image from the command line with: 

```console
docker pull docker.pkg.github.com/snap-contrib/docker-snap/snap:latest
```

And as base image in DockerFile: 

```
FROM docker.pkg.github.com/snap-contrib/docker-snap/snap:latest
```

## Using this image

### GPT

```
docker run --rm -it docker.pkg.github.com/snap-contrib/docker-snap/snap:latest gpt -h
```

### Python and snappy

```
docker run --rm -it docker.pkg.github.com/snap-contrib/docker-snap/snap:latest python -c 'import snappy'
```
