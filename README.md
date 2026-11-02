# Phone Number Processor

A metadata-driven phone number validation and formatting library for Dart.

Features:

- Local and international phone numbers
- Country detection
- Metadata-driven validation
- E.164 generation
- Human-readable formatting
- Deterministic error handling
- Thread-safe
- No third-party dependencies

## Usage

```dart
import 'package:phone_number_processor/phone_number_processor.dart';

final processor =
    PhoneNumberProcessorBuilder.build();

final result = processor.process(
  '01012345678',
  const PhoneOptions(
    defaultCountry: 'EG',
  ),
);

print(result.raw);
```

Output:

```text
+201012345678
```