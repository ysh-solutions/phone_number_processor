import 'country_phone_metadata.dart';
import 'metadata_registry_version.dart';

abstract interface class MetadataRegistry {
  CountryPhoneMetadata? byIso(String iso);
  static const version = MetadataRegistryVersion('2026.11');
  Iterable<CountryPhoneMetadata> get all;
}
