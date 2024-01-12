# rFactor2 Linux Server as Docker image

This is docker container that bootstraps a rFactor 2 container on an ubuntu.

- Under **src/buildimage** you will find prebuid sh scripts to create docker images
- Under **src/composes** you will find prebuid docker composes image
- You need to **add the ServerUnlock.bin file** at the same level as the DockerFile for the build to work.

## Port configuration

The configuration used is the default one inside the image :

- 45100 : vnc server
- 64297/tcp : rf2 simu port
- 64298/udp
- 64299/udp
- 54297/tcp
- 54297/udp

Feel free to remap the ports in the docker compose file.

## Building the image

- Run any src/build_ script to initialize a server.

## Running an image

```Shell
docker run -p 5900:5900 rf2-linux-server-lemans
```

# Thoughts

## "Why on earth did you use PowerShell ??"

I originally wrote some scripts to create and manage rF2 server instance. So I took the shortest road to have the server image working.

Second, I don't like bash. Its syntax is esoteric compared to powershell.

Third, this project is a hobby. Take a deep breath and run docker build ;).
