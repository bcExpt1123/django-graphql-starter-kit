#!/bin/bash

set -e

eval "$(direnv export bash)"
rm -rf ./out
yes "yes" | ./manage.py collectstatic

npm install
npm run build
cp frontend/index.html out

export IMAGE=registry.$BFC_DOMAIN/$BFC_USER/$BFC_APP:latest
docker build -t "$IMAGE" .
docker push "$IMAGE"
