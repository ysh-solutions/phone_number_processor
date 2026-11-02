import 'package:phone_number_processor/metadata/country_phone_metadata.dart';
import 'package:phone_number_processor/metadata/metadata_registry.dart';

final class FakeRegistry implements MetadataRegistry {
  final List<CountryPhoneMetadata> countries;
  const FakeRegistry(this.countries);
  @override
  CountryPhoneMetadata? byIso(String iso) {
    try {
      return countries.firstWhere((country) => country.isoCode == iso);
    } catch (_) {
      return null;
    }
  }

  @override
  Iterable<CountryPhoneMetadata> get all => countries;
}
