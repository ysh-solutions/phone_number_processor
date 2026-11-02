import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:test/test.dart';

import '../helpers/test_processor.dart';

void main() {
  final processor = buildProcessor();

  test('rejects empty string', () {
    final result = processor.process(
      '',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.error, PhoneValidationError.emptyInput);
  });

  test('rejects whitespace only', () {
    final result = processor.process(
      '     ',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.error, PhoneValidationError.emptyInput);
  });
}
