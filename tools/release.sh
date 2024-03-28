#!/bin/bash

set -e
set -o pipefail

GIT=${GIT:="git"}

repoRoot="$("$GIT" rev-parse --show-toplevel)"
cd "$repoRoot"

version="$(git describe --tags)"

sed -i "s/set(_PFL_VERSION \"DEV\")/set(_PFL_VERSION \"${version}\")/g" PFL.cmake

while IFS= read -r line; do
        templ=$(<PFL.cmake)
        value=$(<"$line")
        echo "${templ//include $line/$value}" > PFL.cmake
done < <(grep "include ./" <PFL.cmake | awk '{print $2}')
