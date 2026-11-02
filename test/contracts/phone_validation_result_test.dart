import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/contracts/phone_validation_result.dart';
import 'package:test/test.dart';

void main() {
  group('PhoneValidationResult', () {
    test('valid result satisfies invariants', () {
      final result = PhoneValidationResult.valid(
        originalInput: '01012345678',
        raw: '+201012345678',
        formatted: '+20 10 1234 5678',
        country: 'EG',
        countryCode: '20',
        type: PhoneNumberType.mobile,
      );

      expect(result.isValid, true);

      expect(result.raw, isNotNull);
      expect(result.formatted, isNotNull);
      expect(result.country, isNotNull);
      expect(result.countryCode, isNotNull);
      expect(result.error, isNull);
    });

    test('invalid result satisfies invariants', () {
      final result = PhoneValidationResult.invalid(
        originalInput: '',
        error: PhoneValidationError.emptyInput,
      );

      expect(result.isValid, false);
      expect(result.error, isNotNull);
    });
  });
}
