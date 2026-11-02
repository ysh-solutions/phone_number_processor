import '../../contracts/phone_validation_error.dart';
import '../../metadata/country_phone_metadata.dart';

final class PrefixValidator {
  const PrefixValidator();

  PhoneValidationError? validate(
    CountryPhoneMetadata metadata,
    String nationalNumber,
  ) {
    final mobileMatch =
        metadata.mobilePrefixes.any(
      nationalNumber.startsWith,
    );

    final fixedMatch =
        metadata.fixedLinePrefixes.any(
      nationalNumber.startsWith,
    );

    if (!mobileMatch &&
        !fixedMatch) {
      return PhoneValidationError.numberNotAllowed;
    }

    return null;
  }
}