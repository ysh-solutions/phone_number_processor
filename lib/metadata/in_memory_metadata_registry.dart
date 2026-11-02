import 'package:phone_number_processor/metadata/countries/gb_metadata.dart';
import 'package:phone_number_processor/metadata/countries/us_metadata.dart';

import 'countries/eg_metadata.dart';
import 'country_phone_metadata.dart';
import 'metadata_registry.dart';
import 'metadata_registry_version.dart';

final class InMemoryMetadataRegistry implements MetadataRegistry {
  const InMemoryMetadataRegistry();

  static const _countries = {
    'EG': egyptMetadata,
    'US': usMetadata,
    'GB': gbMetadata,
  };
  static const version = MetadataRegistryVersion('2026.11');

  @override
  CountryPhoneMetadata? byIso(String iso) {
    return _countries[iso.toUpperCase()];
  }

  @override
  Iterable<CountryPhoneMetadata> get all => _countries.values;
}
