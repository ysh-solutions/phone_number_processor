import '../metadata/country_phone_metadata.dart';

final class PhoneValidationContext {
  final CountryPhoneMetadata metadata;

  final String nationalNumber;

  const PhoneValidationContext({
    required this.metadata,
    required this.nationalNumber,
  });
}
