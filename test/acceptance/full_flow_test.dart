import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'full egypt flow',
    () {
      final result = processor.process(
        '+20 (10) 1234-5678',
        const PhoneOptions(
          defaultCountry: 'US',
        ),
      );

      expect(result.isValid, true);

      expect(
        result.raw,
        '+201012345678',
      );

      expect(
        result.formatted,
        '+20 10 1234 5678',
      );

      expect(
        result.country,
        'EG',
      );

      expect(
        result.countryCode,
        '20',
      );
    },
  );
}
