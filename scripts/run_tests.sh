#!/usr/bin/env bash

set -e

dart test --coverage=coverage

dart pub global activate coverage

format_coverage \
  --packages=.dart_tool/package_config.json \
  --report-on=lib \
  --in=coverage \
  --out=coverage/lcov.info \
  --lcov