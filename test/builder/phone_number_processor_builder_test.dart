import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/phone_number_processor_builder.dart';
import 'package:test/test.dart';

void main() {
  test(
    'build creates working processor',
    () {
      final processor = PhoneNumberProcessorBuilder.build();

      final result = processor.process(
        '01012345678',
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
}
