import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'validates local saudi mobile',
    () {
      final result = processor.process(
        '0501234567',
        const PhoneOptions(
          defaultCountry: 'SA',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.raw,
        '+966501234567',
      );

      expect(
        result.country,
        'SA',
      );

      expect(
        result.countryCode,
        '966',
      );

      expect(
        result.type,
        PhoneNumberType.mobile,
      );
    },
  );

  test(
    'detects saudi country from international code',
    () {
      final result = processor.process(
        '+966501234567',
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
        'SA',
      );
    },
  );

  test(
    'formats saudi number',
    () {
      final result = processor.process(
        '0501234567',
        const PhoneOptions(
          defaultCountry: 'SA',
        ),
      );

      expect(
        result.formatted,
        '+966 50 123 4567',
      );
    },
  );
}
