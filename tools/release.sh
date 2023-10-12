#!/bin/bash

set -e
set -o pipefail

GIT=${GIT:="git"}

repoRoot="$("$GIT" rev-parse --show-toplevel)"
cd "$repoRoot"

version="$(git describe --tags)"

sed -i "s/WARNING \"PFL: --==Development Version==--\"/STATUS \"PFL: --==Version: ${version}==--\"/g" PFL.cmake
