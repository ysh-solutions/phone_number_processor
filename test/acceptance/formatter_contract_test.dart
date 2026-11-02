import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'valid numbers always have formatted output',
    () {
      final result = processor.process(
        '01012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.formatted,
        isNotNull,
      );
    },
  );

  test(
    'valid numbers always have raw output',
    () {
      final result = processor.process(
        '01012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.raw,
        isNotNull,
      );
    },
  );
}
