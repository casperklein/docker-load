# docker-load

![Version][version-shield]
![Supports amd64 architecture][amd64-shield]
![Supports aarch64 architecture][aarch64-shield]
![Supports armv7 architecture][armv7-shield]
![Docker image size][image-size-shield]

Generate CPU load with [stress](https://packages.debian.org/buster/stress)

## Parameters

| Parameters | Description |
| - | - |
| -e THREADS="4" | Amount of threads to use |
| -e TIME="60" | Seconds to run the load |
| -e SLEEP="30" | Seconds to sleep between runs |
| -e TZ="Europe/Berlin" | Specify a timezone to use |

## Run

    docker run --rm -it -e TZ="Europe/Berlin" -e THREADS=4 -e TIME=60 -e SLEEP=30 casperklein/load

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-blue.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-blue.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-blue.svg
[version-shield]: https://img.shields.io/github/v/release/casperklein/docker-load
[image-size-shield]: https://img.shields.io/docker/image-size/casperklein/load/latest
