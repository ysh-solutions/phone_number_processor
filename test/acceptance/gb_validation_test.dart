import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test('validates GB international number', () {
    final result = processor.process(
      '+447911123456',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.isValid, true);

    expect(result.country, 'GB');

    expect(result.countryCode, '44');

    expect(result.raw, '+447911123456');
  });
}
