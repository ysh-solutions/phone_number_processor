import 'package:test/test.dart';
import 'package:phone_number_processor/phone_number_processor.dart';

void main() {
  test('consumer can use package through public api only', () {
    final processor = PhoneNumberProcessorBuilder.build();

    final result = processor.process(
      '01012345678',
      const PhoneOptions(
        defaultCountry: 'EG',
      ),
    );

    expect(result.isValid, true);
  });
}
