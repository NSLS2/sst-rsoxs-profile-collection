#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
BEAMLINE_PODS_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

export BEAMLINE_PODS_DIR
export BEAMLINE_NAME="rsoxs"

# Get the latest git tag (stripped of leading "v") and export it as LATEST_GIT_TAG
if git -C "${BEAMLINE_PODS_DIR}" rev-parse >/dev/null 2>&1; then
  RAW_GIT_TAG="$(git -C "${BEAMLINE_PODS_DIR}" describe --tags --abbrev=0 2>/dev/null || echo '')"
  LATEST_GIT_TAG="${RAW_GIT_TAG#v}"
else
  LATEST_GIT_TAG=""
fi


if [[ -z "${NBS_IMAGE_TAG:-}" ]]; then
  if [[ -n "${PIXI_IMAGE_TAG:-}" ]]; then
    export NBS_IMAGE_TAG="${PIXI_IMAGE_TAG}"
  else
    export NBS_IMAGE_TAG="${LATEST_GIT_TAG}"
  fi
fi

if [[ -z "${NBS_IMAGE_REG:-}" ]]; then
  export NBS_IMAGE_REG="ghcr.io/nsls2/sst-"${BEAMLINE_NAME}"-profile-collection/"${BEAMLINE_NAME}"-"
fi

if [[ $# -eq 0 ]]; then
  exec nbs-pods start
fi

exec nbs-pods "$@"

