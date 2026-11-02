import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'accepts formatted egyptian number',
    () {
      final result = processor.process(
        '+20 (10) 1234-5678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, true);

      expect(
        result.raw,
        '+201012345678',
      );
    },
  );

  test(
    'accepts leading spaces',
    () {
      final result = processor.process(
        '   +201012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, true);
    },
  );

  test(
    'accepts trailing spaces',
    () {
      final result = processor.process(
        '+201012345678   ',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, true);
    },
  );
}
