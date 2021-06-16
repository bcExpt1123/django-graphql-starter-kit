#!/bin/bash

set -ex

direnv allow
eval "$(direnv export bash)"

SECRET=$(python -c "import secrets; print(secrets.token_urlsafe())")
echo "DJANGO_SECRET_KEY=\"$SECRET\"" > .envrc.secret

direnv allow
