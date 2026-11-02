import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'rejects extension numbers',
    () {
      final result = processor.process(
        '+201012345678 ext 123',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidCharacters,
      );
    },
  );

  test(
    'rejects alphabetic input',
    () {
      final result = processor.process(
        'abc123',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidCharacters,
      );
    },
  );

  test(
    'rejects mixed alpha numeric input',
    () {
      final result = processor.process(
        '+20A1012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidCharacters,
      );
    },
  );
}
