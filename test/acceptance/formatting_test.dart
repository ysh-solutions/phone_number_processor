import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'returns formatted egyptian output',
    () {
      final result = processor.process(
        '01012345678',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(result.isValid, true);

      expect(
        result.formatted,
        '+20 10 1234 5678',
      );
    },
  );
}
