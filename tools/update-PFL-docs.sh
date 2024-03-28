#!/bin/bash

set -e
set -o pipefail

GIT=${GIT:="git"}

repoRoot="$("$GIT" rev-parse --show-toplevel)"
cd "$repoRoot"

curl https://api.csswg.org/bikeshed/ -F \
	url=https://raw.githubusercontent.com/vector-of-bool/pitchfork/develop/data/spec.bs |
        sed 's/[[:space:]]*$//' \
	>docs/PFL.html
