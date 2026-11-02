import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/metadata/countries/eg_metadata.dart';
import 'package:phone_number_processor/validation/rules/length_validator.dart';
import 'package:test/test.dart';

void main() {
  group('LengthValidator', () {
    const validator = LengthValidator();

    test('valid length', () {
      final error = validator.validate(egyptMetadata, '1012345678');

      expect(error, isNull);
    });

    test('too short', () {
      final error = validator.validate(egyptMetadata, '1012');

      expect(error, PhoneValidationError.tooShort);
    });
  });
}
