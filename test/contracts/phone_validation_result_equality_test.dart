import 'package:test/test.dart';
import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_validation_result.dart';

void main() {
  test('valid results with same values are equal', () {
    final a = PhoneValidationResult.valid(
      originalInput: '01012345678',
      raw: '+201012345678',
      formatted: '+20 10 1234 5678',
      country: 'EG',
      countryCode: '20',
      type: PhoneNumberType.mobile,
    );

    final b = PhoneValidationResult.valid(
      originalInput: '01012345678',
      raw: '+201012345678',
      formatted: '+20 10 1234 5678',
      country: 'EG',
      countryCode: '20',
      type: PhoneNumberType.mobile,
    );

    expect(a, b);
  });
}
