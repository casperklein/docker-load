FROM	debian:10-slim as build

ENV	USER="casperklein"
ENV	NAME="docker-load"
ENV	VERSION="0.1"

ENV	PACKAGES="sysbench"
ENV	PACKAGES_CLEAN=""

SHELL	["/bin/bash", "-o", "pipefail", "-c"]

# Add backports

# Install packages
RUN	echo 'deb http://deb.debian.org/debian buster-backports main' >> /etc/apt/sources.list \
&&	apt-get update \
&&	apt-get -y upgrade \
&&	apt-get -y --no-install-recommends install $PACKAGES

CMD	["/bin/bash", "-c", "while :; do date; sysbench cpu --cpu-max-prime=9999 --threads=4 --time=60 run; sleep 30; done"]
