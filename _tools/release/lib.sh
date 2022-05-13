#!/usr/bin/env bash

version_file_path=version.go

# Parse in the given string argument any version string of the form v<major>.<minor>.<patch>(-rc.<rc>)? and set the
# the matched version, major, minor, patch and rc numbers in a global associative array called `version`.
function parse_version() {
  version=""
  major=""
  minor=""
  patch=""
  rc=""
  if [[ "$1" =~ v([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)(-rc\.([[:digit:]]+))? ]]; then
    version=${BASH_REMATCH[0]}
    major=${BASH_REMATCH[1]}
    minor=${BASH_REMATCH[2]}
    patch=${BASH_REMATCH[3]}
    rc=${BASH_REMATCH[5]}
  fi
  declare -gA version=(
    [version]="$version"
    [major]="$major"
    [minor]="$minor"
    [patch]="$patch"
    [rc]="$rc"
  )
}

function parse_version_file() {
  parse_version "$(cat $version_file_path)"
}