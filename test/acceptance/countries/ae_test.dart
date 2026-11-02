import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'validates local uae mobile',
    () {
      final result = processor.process(
        '0501234567',
        const PhoneOptions(
          defaultCountry: 'AE',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.raw,
        '+971501234567',
      );

      expect(
        result.country,
        'AE',
      );

      expect(
        result.countryCode,
        '971',
      );

      expect(
        result.type,
        PhoneNumberType.mobile,
      );
    },
  );

  test(
    'detects uae from country code',
    () {
      final result = processor.process(
        '+971501234567',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.country,
        'AE',
      );
    },
  );

  test(
    'formats uae mobile',
    () {
      final result = processor.process(
        '0501234567',
        const PhoneOptions(
          defaultCountry: 'AE',
        ),
      );

      expect(
        result.formatted,
        '+971 50 123 4567',
      );
    },
  );
}
