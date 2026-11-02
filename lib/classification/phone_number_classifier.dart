import '../contracts/phone_number_type.dart';
import '../metadata/country_phone_metadata.dart';

final class PhoneNumberClassifier {
  const PhoneNumberClassifier();

  PhoneNumberType classify(
    CountryPhoneMetadata metadata,
    String nationalNumber,
  ) {
    if (metadata.mobilePrefixes.any(
      nationalNumber.startsWith,
    )) {
      return PhoneNumberType.mobile;
    }

    if (metadata.fixedLinePrefixes.any(
      nationalNumber.startsWith,
    )) {
      return PhoneNumberType.fixedLine;
    }

    return PhoneNumberType.unknown;
  }
}
