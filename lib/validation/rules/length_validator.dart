import '../../contracts/phone_validation_error.dart';
import '../../metadata/country_phone_metadata.dart';

final class LengthValidator {
  const LengthValidator();

  PhoneValidationError? validate(
    CountryPhoneMetadata metadata,
    String nationalNumber,
  ) {
    final lengths = metadata.validLengths;

    final minLength =
        lengths.reduce((a, b) => a < b ? a : b);

    final maxLength =
        lengths.reduce((a, b) => a > b ? a : b);

    if (nationalNumber.length < minLength) {
      return PhoneValidationError.tooShort;
    }

    if (nationalNumber.length > maxLength) {
      return PhoneValidationError.tooLong;
    }

    if (!lengths.contains(nationalNumber.length)) {
      return PhoneValidationError.invalidLength;
    }

    return null;
  }
}