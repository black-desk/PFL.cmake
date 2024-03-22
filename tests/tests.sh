#!/bin/env bash

set -e
set -x

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

while IFS= read -r line; do
	[ -f "$line" ] || [ -d "$line" ]
done <expected-files

rm build -rf
mkdir build
pushd build
cmake .. -DCMAKE_PREFIX_PATH="$(pwd)/../build-install-prefix"
cmake --build .
popd
