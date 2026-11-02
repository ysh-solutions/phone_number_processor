import 'countries/eg_metadata.dart';
import 'countries/gb_metadata.dart';
import 'countries/sa_metadata.dart';
import 'countries/us_metadata.dart';
import 'country_phone_metadata.dart';
import 'metadata_registry.dart';
import 'metadata_registry_version.dart';

final class InMemoryMetadataRegistry implements MetadataRegistry {
  const InMemoryMetadataRegistry();

  static const _countries = {
    'EG': egyptMetadata,
    'GB': gbMetadata,
    'SA': saudiArabiaMetadata,
    'US': usMetadata,
  };
  static const version = MetadataRegistryVersion('2026.11');

  @override
  CountryPhoneMetadata? byIso(String iso) {
    return _countries[iso.toUpperCase()];
  }

  @override
  Iterable<CountryPhoneMetadata> get all => _countries.values;
}
