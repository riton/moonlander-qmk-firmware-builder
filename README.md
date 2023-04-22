# Build moonlander firmware with QMK

## Create base build image

```
$ make
```

The base image will be named `qmk-moonlander-build:latest`

## Build your firmware

1. Download `.zip` archive from Oryx and extract to `/tmp/latest` for example

2. Run `docker run --rm -v /tmp/latest/moonlander_custom-azerty_source:/keymap qmk-moonlander-build:latest`

Your new firmware file is ready at `/tmp/latest/builded/moonlander_custom.bin`

## Flash firmware

Use `wally` to flash the new firmware
