#!/bin/bash

set -ex

direnv allow
eval "$(direnv export bash)"

SECRET=$(python -c "import secrets; print(secrets.token_urlsafe())")
echo "DJANGO_SECRET_KEY=\"$SECRET\"" > .envrc.secret

direnv allow

sd "@BFC_APP_DOMAIN@" "$BFC_APP_DOMAIN" package.json
sd "@BFC_APP_DOMAIN@" "$BFC_APP_DOMAIN" ./frontend/index.html
