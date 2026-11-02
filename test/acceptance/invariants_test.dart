import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'valid result satisfies invariants',
    () {
      final result = processor.process(
        '01012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, true);

      expect(result.raw, isNotNull);
      expect(result.formatted, isNotNull);
      expect(result.country, isNotNull);
      expect(result.countryCode, isNotNull);

      expect(result.error, isNull);
    },
  );

  test(
    'invalid result satisfies invariants',
    () {
      final result = processor.process(
        'ABC123',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, false);

      expect(result.error, isNotNull);
    },
  );
}
