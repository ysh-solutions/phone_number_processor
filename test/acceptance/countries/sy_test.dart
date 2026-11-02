import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'validates local syrian mobile',
    () {
      final result = processor.process(
        '0944123456',
        const PhoneOptions(
          defaultCountry: 'SY',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.raw,
        '+963944123456',
      );

      expect(
        result.country,
        'SY',
      );

      expect(
        result.countryCode,
        '963',
      );

      expect(
        result.type,
        PhoneNumberType.mobile,
      );
    },
  );

  test(
    'detects syria from country code',
    () {
      final result = processor.process(
        '+963944123456',
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
        'SY',
      );
    },
  );

  test(
    'formats syrian mobile',
    () {
      final result = processor.process(
        '0944123456',
        const PhoneOptions(
          defaultCountry: 'SY',
        ),
      );

      expect(
        result.formatted,
        '+963 94 412 3456',
      );
    },
  );
}
