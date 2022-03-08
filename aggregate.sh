#!/bin/sh

ls | grep step | xargs cat | grep -v '#!/bin/sh' | sed 's/^\#\s//' > README.md