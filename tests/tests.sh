#!/bin/env bash

set -e

CMAKE=${CMAKE:="cmake"}

GIT=${GIT:="git"}

REPOSITORY="$("$GIT" rev-parse --show-toplevel)"
cd "$REPOSITORY/tests"

echo "Try to build all examples..."

build-and-install() {
	project="$1"
	rm "$project/build" -rf
	mkdir "$project/build"
	pushd "$project/build"
	cmake .. --warn-uninitialized -Werror=dev \
		-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
		-DCMAKE_INSTALL_PREFIX="$REPOSITORY/tests/build-install-prefix" \
		-DCMAKE_GENERATOR="Unix Makefiles"
	cmake --build .
	make install
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

# FIXME:
# We should add -Werror=dev,
# but cmake 3.29.0 failed with -Werror=dev for accessing uninitialized variable
# _cmake_import_check_xcframework_for_*.
cmake .. --warn-uninitialized \
	-DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
	-DCMAKE_PREFIX_PATH="$(pwd)/../build-install-prefix"
cmake --build .
popd

while IFS= read -r line; do
	if [ -f "$line" ] || [ -d "$line" ]; then
		continue
	fi
	echo "Expected $line but not found."
	exit 255
done <expected-files
