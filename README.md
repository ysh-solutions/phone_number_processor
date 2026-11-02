# Phone Number Processor

A metadata-driven phone number validation and formatting library for Dart.

## Features

- Local and international phone number support
- Country detection
- Metadata-driven validation
- E.164 generation
- Human-readable formatting
- Mobile/fixed-line classification
- Deterministic error handling
- Thread-safe
- No runtime third-party dependencies

---

## Installation

Add the package to your project:

```bash
dart pub add phone_number_processor
```

---

## Usage

```dart
import 'package:phone_number_processor/phone_number_processor.dart';

void main() {
  final processor =
      PhoneNumberProcessorBuilder.build();

  final result = processor.process(
    '01012345678',
    const PhoneOptions(
      defaultCountry: 'EG',
    ),
  );

  print(result.isValid);
  print(result.raw);
  print(result.formatted);
}
```

Output:

```text
true
+201012345678
+20 10 1234 5678
```

---

## Supported Countries

Currently included:

- Egypt (EG)
- United States (US)
- United Kingdom (GB)

Additional countries can be added through metadata without changing the validation engine.

---

## Development Setup

Clone the repository:

```bash
git clone github.com/ysh-solutions/phone_number_processor
cd phone_number_processor
```

Install dependencies:

```bash
dart pub get
```

Install Git hooks:

```bash
scripts/install_pre_commit.sh
```

---

## Development Commands

Run static analysis:

```bash
scripts/run_linting.sh
```

Generate API documentation:

```bash
scripts/generate_docs.sh
```

Run tests:

```bash
scripts/run_tests.sh
```

Generate coverage report:

```bash
scripts/generate_test_coverage_report.sh
```

Run all checks:

```bash
scripts/all.sh
```

---

## Pre-Commit Checks

The repository uses pre-commit hooks.

Before every commit:

- Code is formatted
- Static analysis is executed
- Tests are executed

To manually run all hooks:

```bash
pre-commit run --all-files
```

---

## Architecture

Processing pipeline:

```text
Input
 ↓
Normalizer
 ↓
Country Resolver
 ↓
Validator
 ↓
E.164 Generator
 ↓
Formatter
 ↓
Result
```

The validation engine is country-agnostic.

Country-specific behavior is provided through metadata.

---

## License

MIT