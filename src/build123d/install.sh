#!/bin/sh
set -e

echo "Activating feature 'build123d'"

echo "Installing build123d system dependencies..."
apt-get update && apt-get install -y --no-install-recommends \
    libgl1 \
	libice6 \
    && rm -rf /var/lib/apt/lists/*

echo "Installing build123d version: ${VERSION}"
if [ "${VERSION}" = "latest" ]; then
    pip3 install --no-cache-dir build123d
else
    pip3 install --no-cache-dir build123d=="${VERSION}"
fi