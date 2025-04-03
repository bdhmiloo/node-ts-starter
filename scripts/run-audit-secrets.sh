#!/bin/sh

set -e

BASELINE_FILE=".secrets.baseline"
AUDIT_BASELINE="grep -c '\"line_number\": [0-9]*$' $BASELINE_FILE"
SECRETS_FOUND="grep -c '\"is_secret\": true' $BASELINE_FILE"

detect-secrets scan . --baseline $BASELINE_FILE

check_if_baseline_needs_whitelisting() {
  if [ ! "$(eval "$AUDIT_BASELINE")" -eq "0" ]; then
    echo "please determine if potential secrets are to be whitelisted"
    return 0
  else
    return 1
  fi
}

while
  detect-secrets audit $BASELINE_FILE
  check_if_baseline_needs_whitelisting
do true; done

if [ ! "$(eval "$SECRETS_FOUND")" -eq "0" ]; then
  echo "potential secrets have been found to be committed, please check $BASELINE_FILE and remove marked secrets"
  exit 1
else
  echo "no secrets detected in files"
fi
