import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'rejects multiple pluses',
    () {
      final result = processor.process(
        '++201012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidFormat,
      );
    },
  );

  test(
    'rejects plus in middle',
    () {
      final result = processor.process(
        '20+1012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidFormat,
      );
    },
  );

  test(
    'rejects plus only',
    () {
      final result = processor.process(
        '+',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.invalidFormat,
      );
    },
  );
}
