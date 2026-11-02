import '../metadata/country_phone_metadata.dart';

final class E164Generator {
  const E164Generator();

  String generate({
    required CountryPhoneMetadata metadata,
    required String nationalNumber,
  }) {
    return '+'
        '${metadata.countryCode}'
        '$nationalNumber';
  }
}
