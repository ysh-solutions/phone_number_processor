import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'validates US number',
    () {
      final result = processor.process(
        '2025551234',
        const PhoneOptions(
          defaultCountry: 'US',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.country,
        'US',
      );

      expect(
        result.countryCode,
        '1',
      );

      expect(
        result.raw,
        '+12025551234',
      );
    },
  );
}
