#!/bin/sh

set -eu

# setup pre-commit / pre-push hooks
brew install pre-commit
pre-commit install --hook-type pre-commit --hook-type pre-push
echo "finished installing pre-commit.."

# setup secret scan
brew install detect-secrets
echo "finished installing detect-secrets.."
