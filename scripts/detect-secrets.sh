#!/bin/sh

set -e

git ls-files -z | xargs -0 detect-secrets-hook --baseline .secrets.baseline
