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

POST=public/posts/hello-world/index.html
test -f "$POST"                                  || fail "sample post missing"
grep -qE '<pre class="?mermaid' "$POST"                || fail "mermaid block not rendered"
grep -q 'js/mermaid-' "$POST"                  || fail "mermaid script not loaded on diagram page"
! grep -q 'mermaid' public/about/index.html      || fail "mermaid loaded on page without diagram"
! test -e public/posts/draft-example             || fail "draft post published"
grep -q 'Hello, world' public/index.xml          || fail "sample post missing from RSS"
grep -q 'og:title' "$POST"                       || fail "og:title missing"
grep -qE 'class="?chroma' "$POST"                  || fail "syntax highlighting missing"
! grep -q '<title>About</title>' public/index.xml || fail "about page in RSS"
! grep -q '"About"' public/index.json            || fail "about page in search index"
! grep -qE 'cdn\.jsdelivr|unpkg\.com' "$POST"   || fail "third-party script on post"
grep -qE '<script src="?/js/mermaid[^>]*integrity' "$POST" || fail "mermaid not self-hosted with SRI"
grep -q 'dataset.theme' "$POST"                  || fail "mermaid not following data-theme"
! grep -q 'linkedin.com/"' public/index.html     || fail "placeholder LinkedIn link"

echo "OK"
