FROM	debian:10-slim as build

ENV	PACKAGES="stress"

SHELL	["/bin/bash", "-o", "pipefail", "-c"]

# Add backports and install sysbench
ENV	DEBIAN_FRONTEND=noninteractive
RUN	apt-get update \
&&	apt-get -y upgrade \
&&	apt-get -y --no-install-recommends install $PACKAGES \
&&	rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY	rootfs /

# Build final image
FROM	scratch

CMD	["/run.sh"]

COPY	--from=build / /
