ARG BUILD_FROM=ghcr.io/hassio-addons/base/amd64:9.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG TAILSCALE_VERSION="1.2.10"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV LANG C.UTF-8

# Download and install tailscale to /bin from https://pkgs.tailscale.com/stable/#static
COPY install2.sh /
RUN chmod a+x /install2.sh
RUN /install2.sh $BUILD_ARCH $TAILSCALE_VERSION

# Install iptables dependency
RUN apk update
RUN apk add -U iptables

COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]
