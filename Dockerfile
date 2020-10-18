FROM	debian:10-slim as build

ENV	USER="casperklein"
ENV	NAME="load"
ENV	VERSION="0.2"

ENV	PACKAGES="stress"

SHELL	["/bin/bash", "-o", "pipefail", "-c"]

# Add backports and install sysbench
RUN	apt-get update \
&&	apt-get -y upgrade \
&&	apt-get -y --no-install-recommends install $PACKAGES \
&&	rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY	rootfs /

FROM    scratch
COPY    --from=build / /

CMD	["/run.sh"]
