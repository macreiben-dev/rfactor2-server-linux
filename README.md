# rFactor2 Linux Server as Docker image

This is docker container that bootstraps a rFactor 2 container on an ubuntu.

- Under **src/buildimage** you will find prebuid sh scripts to create docker images
- Under **src/composes** you will find prebuid docker composes image
- You need to **add the ServerUnlock.bin file** to the mounted volume on the docker compose file otherwise, you won't be able to install DLCs.
  - *Do not commit your ServerUnlock.bin file* to a public repository otherwise your license will be used by other.

## Port configuration

The port configuration defined in docker compose must the same as the those declared in the server - which lives in the container. 

When the server starts, it registers the port in the ladder. Use docker NAT to use different port won't work because rf2 server is not aware of the docker compose NAT configuration.

Example :

```yml
 ports:
      - 46100:5900
      - 65297:65297/tcp
      - 65298:65298/udp
      - 65299:65299/udp
      - 55297:55297/tcp
      - 55297:55297/udp
```

## Building the image

- Run any src/build_ script to initialize a server.

## Running an image

```Shell
docker run -p 5900:5900 rf2-linux-server-lemans
```

## Cleanup sh script from windows EOF char

When editing from windows or using GIT causes end of line to change from CRLF to LF. 

This makes the sh scripts fail. So there are two ways to solve this issue.

### Using a script

```Shell
sed 's/\r$//' input_file.txt > output_file.txt 
```

So this sed script remove them. You should use LF end of lines in your code editor.

### Configuring GIT

#### Disable auto CRLF on GIT

```Shell
git config --global core.autocrlf false
```

#### Eventually set default eof to LF

```Shell
git config --global core.eol lf
```

# Thoughts

## "Why on earth did you use PowerShell ??"

I originally wrote some scripts to create and manage rF2 server instance. So I took the shortest road to have the server image working.

Second, I don't like bash. Its syntax is esoteric compared to powershell.

Third, this project is a hobby. Take a deep breath and run docker build ;).
