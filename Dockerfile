FROM	debian:12-slim as build

ARG	PACKAGES="stress"

SHELL	["/bin/bash", "-o", "pipefail", "-c"]

# Add backports and install sysbench
ARG	DEBIAN_FRONTEND=noninteractive
RUN	apt-get update \
&&	apt-get -y upgrade \
&&	apt-get -y --no-install-recommends install $PACKAGES \
&&	rm -rf /var/lib/apt/lists/*

# Copy root filesystem
COPY	rootfs /

# Build final image
FROM	scratch

ARG	VERSION="unknown"

LABEL	org.opencontainers.image.description="Generate CPU load with 'stress'"
LABEL	org.opencontainers.image.source="https://github.com/casperklein/docker-load/"
LABEL	org.opencontainers.image.title="docker-load"
LABEL	org.opencontainers.image.version="$VERSION"

CMD	["/run.sh"]

COPY	--from=build / /
