# Contributing

## Setup

```bash
dart pub get
scripts/install_pre_commit.sh
```

## Before Submitting Changes

Run:

```bash
scripts/all.sh
```

Ensure:

- All tests pass
- Analyzer reports no issues
- Coverage report generates successfully

## Pull Requests

- Add tests for all new behavior.
- Keep public APIs documented.
- Avoid introducing country-specific logic into the engine.
- Prefer metadata-driven solutions.