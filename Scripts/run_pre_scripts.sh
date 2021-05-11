#!/usr/bin/env bash

set -x

if which mint >/dev/null; then 
  mint run swiftgen
  mint run swiftlint autocorrect
  mint run swiftlint
else 
  echo "warning: mint not installed, execute brew install mint!" 
fi