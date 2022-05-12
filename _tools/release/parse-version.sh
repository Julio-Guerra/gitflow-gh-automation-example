#!/bin/bash
set -e
[[ "$1" =~ v([[:digit:]]+)\.([[:digit:]]+)\.([[:digit:]]+)(-rc\.([[:digit:]]+))? ]]
echo "::set-output name=version::${BASH_REMATCH[0]}"
echo "::set-output name=major::${BASH_REMATCH[1]}"
echo "::set-output name=minor::${BASH_REMATCH[2]}"
echo "::set-output name=patch::${BASH_REMATCH[3]}"
echo "::set-output name=rc::${BASH_REMATCH[5]}"
