#!/bin/bash
set -e

./increment.sh && flutter clean && flutter build web -t lib/main.dart # && ./after-build.sh && git add -f build/web
