import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test(
    'processor is deterministic under load',
    () async {
      final futures = List.generate(
        1000,
        (_) => Future(
          () => processor.process(
            '01012345678',
            const PhoneOptions(
              defaultCountry: 'EG',
            ),
          ),
        ),
      );

      final results = await Future.wait(futures);

      for (final result in results) {
        expect(
          result.isValid,
          true,
        );

        expect(
          result.raw,
          '+201012345678',
        );
      }
    },
  );
}
