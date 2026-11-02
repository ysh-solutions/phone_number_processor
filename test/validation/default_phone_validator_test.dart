import 'package:phone_number_processor/classification/phone_number_classifier.dart';
import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/metadata/countries/eg_metadata.dart';
import 'package:phone_number_processor/validation/default_phone_validator.dart';
import 'package:phone_number_processor/validation/phone_validation_context.dart';
import 'package:phone_number_processor/validation/rules/length_validator.dart';
import 'package:phone_number_processor/validation/rules/prefix_validator.dart';
import 'package:test/test.dart';

void main() {
  const validator = DefaultPhoneValidator(
    lengthValidator: LengthValidator(),
    prefixValidator: PrefixValidator(),
    classifier: PhoneNumberClassifier(),
  );

  test('valid egypt mobile', () {
    final result = validator.validate(
      PhoneValidationContext(
        metadata: egyptMetadata,
        nationalNumber: '1012345678',
      ),
    );

    expect(result.valid, true);

    expect(result.type, PhoneNumberType.mobile);
  });

  test('too short', () {
    final result = validator.validate(
      PhoneValidationContext(metadata: egyptMetadata, nationalNumber: '1012'),
    );

    expect(result.error, PhoneValidationError.tooShort);
  });

  test('too long', () {
    final result = validator.validate(
      PhoneValidationContext(
        metadata: egyptMetadata,
        nationalNumber: '010123456789999',
      ),
    );

    expect(result.error, PhoneValidationError.tooLong);
  });

  test('invalid prefix', () {
    final result = validator.validate(
      PhoneValidationContext(
        metadata: egyptMetadata,
        nationalNumber: '9912345678',
      ),
    );

    expect(result.error, PhoneValidationError.numberNotAllowed);
  });
  test(
    'classifies fixed line number',
    () {
      final result = validator.validate(
        PhoneValidationContext(
          metadata: egyptMetadata,
          nationalNumber: '2123456789',
        ),
      );

      expect(
        result.valid,
        true,
      );

      expect(
        result.type,
        PhoneNumberType.fixedLine,
      );
    },
  );
}
