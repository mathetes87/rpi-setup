# rpi-setup
Raspberry Pi setup for home entertainment.

TODO
- https://gist.github.com/exocode/36f9412532055275f2aed81cd157602a
- https://www.reddit.com/r/Piracy/comments/cuzmro/guide_how_to_set_up_docker_containers_to/ (see comments!)

## Flash HypriotOS for easy docker and docker-compose setup
1. Insert SD card
2. Run the following script
```bash
chmod +x flash.sh && ./flash.sh
```

## Setup Raspberry environment
1. SSH into the system with
```bash
ssh mathetes@rpi.local
```
2. Once logged in run
```bash
./init.sh
```

NOTE: password hash generated with command
```bash
docker run --rm httpd:2.4-alpine htpasswd -nbB admin '<your_password_12_chars_or_more>' | cut -d ":" -f 2
# hint portainer2112
```

## TODO
Setup Raspberry Pi 2b with HypriotOS with the following

- [portainer](https://github.com/portainer/portainer)
- [raspotify](https://github.com/flaviostutz/rpi-spotify)
- [earnapp](https://hub.docker.com/r/fazalfarhan01/earnapp)
- [plex](https://hub.docker.com/r/linuxserver/plex)
- 