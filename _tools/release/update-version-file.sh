#!/usr/bin/env bash

#
# This script updates the version.go file with the given version string.
#

set -ex
source _tools/release/lib.sh

# Validate the given argument is a correct version number
next="$1"
parse_version "$next"
if [[ "$next" = "" || "${version[version]}" != "$next" ]]; then
  echo "error: unexpected argument value \`$next\`: a valid version string is expected"
  exit 1
fi;

# Replace the current version of the file by the new version
parse_version_file
current=${version[version]}
echo Replacing $current into $next in $version_file_path
sed -i "s#$current#$next#g" $version_file_path
