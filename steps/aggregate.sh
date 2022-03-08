#!/bin/sh

cd "$(dirname "$0")"
ls | grep step | xargs cat | grep -v '#!/bin/sh' | sed 's/^\#\s//' > README.md
mv README.md ../README.md