scripts/run_tests.sh
dart run coverage_lens:coverage_lens report \
  --lcov coverage/lcov.info \
  --source . \
  --out coverage/html