#!/usr/bin/env sh
#shellcheck shell=sh

set -xe

REPO=fredclausen
IMAGE=rest980
PLATFORMS="linux/arm64"

docker context use default
export DOCKER_CLI_EXPERIMENTAL="enabled"
docker buildx use cluster

# Build & push latest
docker buildx build -f Dockerfile -t "${REPO}/${IMAGE}:latest" --compress --push --platform "${PLATFORMS}" .
