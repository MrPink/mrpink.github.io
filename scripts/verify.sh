#!/usr/bin/env bash
# Builds the site and checks the output. Run from the repo root.
set -euo pipefail
rm -rf public
hugo --gc --minify --panicOnWarning >/dev/null

fail() { echo "FAIL: $*" >&2; exit 1; }

test -f public/index.html            || fail "home page missing"
test -f public/about/index.html      || fail "about page missing"
test -f public/index.json            || fail "search index missing"
test -f public/index.xml             || fail "RSS feed missing"

echo "OK"
