#!/bin/env bash

set -e

CMAKE=${CMAKE:="cmake"}

GIT=${GIT:="git"}

REPOSITORY="$("$GIT" rev-parse --show-toplevel)"
cd "$REPOSITORY/tests"

echo "Try to build all examples..."

build-and-install() {
	project="$1"
	pushd "$project"
	rm build -rf
	mkdir build
	pushd build
	cmake .. -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$REPOSITORY/tests/build-install-prefix"
	cmake --build .
	make install
	popd
	popd
}

rm -rf "$REPOSITORY/tests/build-install-prefix"

build-and-install "../examples/library"
build-and-install "../examples/application"
build-and-install "../examples/libraries"

echo "Try to build all examples...Done"

rm build -rf
mkdir build
pushd build
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_PREFIX_PATH="$(pwd)/../build-install-prefix"
cmake --build .
popd

while IFS= read -r line; do
	if [ -f "$line" ] || [ -d "$line" ]; then
                continue;
        fi
        echo "Expected $line but not found."
        exit 255
done <expected-files

