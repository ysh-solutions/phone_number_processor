import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'same input always produces same error',
    () {
      for (var i = 0; i < 1000; i++) {
        final result = processor.process(
          '++2010',
          const PhoneOptions(
            defaultCountry: 'EG',
          ),
        );

        expect(
          result.error,
          PhoneValidationError.invalidFormat,
        );
      }
    },
  );
}
