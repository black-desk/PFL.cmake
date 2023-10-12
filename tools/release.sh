#!/bin/bash

set -e
set -o pipefail

GIT=${GIT:="git"}

repoRoot="$("$GIT" rev-parse --show-toplevel)"
cd "$repoRoot"

version="$(git describe --tags)"

sed -i "s/--==Development Version==--/Version: ${version}/g" PFL.cmake
