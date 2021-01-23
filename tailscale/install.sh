#! /bin/sh
set -eu

echo "ARGS: $@"

BUILD_ARCH="$1"
TAILSCALE_VERSION="$2"

echo "Downloading tailscale $TAILSCALE_VERSION for $BUILD_ARCH"

# Convert hass arch to tailscale
case "$BUILD_ARCH" in
    "armhf" | "armv7")
        TAILSCALE_ARCH="arm"
    ;;
    "aarch64")
        TAILSCALE_ARCH="arm64"
    ;;
    "amd64")
        TAILSCALE_ARCH="amd64"
    ;;
    "i386")
        TAILSCALE_ARCH="386"
    ;;
esac

wget --no-check-certificate https://pkgs.tailscale.com/stable/tailscale_1.2.10_amd64.tgz -O - | tar xzf -
mv tailscale_1.2.10_amd64/tailscale* /bin
rm -rf tailscale_1.2.10_amd64
