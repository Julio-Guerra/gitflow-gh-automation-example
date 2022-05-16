#!/usr/bin/env bash

#
# This script renders the release template with the given template variables:
# render-pr-template.sh \
#   <RELEASE_VERSION> \
#   <RELEASE_NOTE_URL>
#

set -e


if [[ $# -ne 2 ]]; then
  echo unexpected number of arguments
  exit 1
fi

RELEASE_VERSION="$1"
RELEASE_NOTE_URL="$2"

sed -e "s#\$RELEASE_VERSION#$RELEASE_VERSION#g" \
    -e "s#\$RELEASE_NOTE_URL#$RELEASE_NOTE_URL#g" \
    .github/PULL_REQUEST_TEMPLATE/release.md