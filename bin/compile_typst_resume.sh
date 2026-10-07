#!/usr/bin/env bash

set -eu
set -o pipefail

cd "$(dirname "$0")"/..

cd ./private

docker run --rm \
  -v "$PWD:/data" \
  -w /data \
  --user "$(id -u):$(id -g)" \
  ghcr.io/typst/typst:latest \
  compile resume.typ
