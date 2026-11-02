import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'equivalent inputs produce same canonical result',
    () {
      final local = processor.process(
        '01012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      final international = processor.process(
        '+201012345678',
        const PhoneOptions(
          defaultCountry: 'US',
        ),
      );

      expect(
        local.raw,
        international.raw,
      );

      expect(
        local.country,
        international.country,
      );

      expect(
        local.countryCode,
        international.countryCode,
      );

      expect(
        local.formatted,
        international.formatted,
      );
    },
  );
}
