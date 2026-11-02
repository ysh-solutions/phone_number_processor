#!/usr/bin/env bash

set -e

echo "Installing pre-commit..."

python -m pip install --upgrade pre-commit

echo "Installing Git hooks..."

pre-commit install
pre-commit install --hook-type pre-push

echo "Done."