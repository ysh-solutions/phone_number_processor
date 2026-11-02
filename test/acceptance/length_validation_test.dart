import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'returns too short',
    () {
      final result = processor.process(
        '01012',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.tooShort,
      );
    },
  );

  test(
    'returns too long',
    () {
      final result = processor.process(
        '010123456789999999',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.error,
        PhoneValidationError.tooLong,
      );
    },
  );
}
