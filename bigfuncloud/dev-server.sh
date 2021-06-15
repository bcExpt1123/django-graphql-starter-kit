#!/bin/bash


eval "$(direnv export bash)"

./bigfuncloud/dev-setup.sh
eval "$(direnv export bash)"

mkdir -p ./out
cp frontend/index.html out/

watchexec --exts py -- "invalidate-devserver && ./manage.py runserver 3030" &
watchexec -r -w frontend -- "npm run build && invalidate-devserver" &
watchexec -w "Caddyfile" -- "caddy run && invalidate-devserver"
