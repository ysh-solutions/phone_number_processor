import '../contracts/phone_validation_error.dart';
import '../metadata/country_phone_metadata.dart';
import '../metadata/metadata_registry.dart';
import 'country_resolution_result.dart';
import 'country_resolver.dart';

final class DefaultCountryResolver implements CountryResolver {
  final MetadataRegistry registry;

  const DefaultCountryResolver(this.registry);

  @override
  CountryResolutionResult resolve(String input, String defaultCountry) {
    if (input.startsWith('+')) {
      return _resolveInternational(input);
    }

    final metadata = registry.byIso(defaultCountry);

    if (metadata == null) {
      return CountryResolutionResult.failure(
        PhoneValidationError.unsupportedCountry,
      );
    }

    var nationalNumber = input;

    if (nationalNumber.startsWith(metadata.nationalPrefix)) {
      nationalNumber = nationalNumber.substring(metadata.nationalPrefix.length);
    }

    return CountryResolutionResult.success(
      metadata: metadata,
      nationalNumber: nationalNumber,
    );
  }

  CountryResolutionResult _resolveInternational(String input) {
    final digits = input.substring(1);

    CountryPhoneMetadata? match;

    for (final country in registry.all) {
      if (digits.startsWith(country.countryCode)) {
        if (match == null ||
            country.countryCode.length > match.countryCode.length) {
          match = country;
        }
      }
    }

    if (match == null) {
      return CountryResolutionResult.failure(
        PhoneValidationError.invalidCountryCode,
      );
    }

    final nationalNumber = digits.substring(match.countryCode.length);

    return CountryResolutionResult.success(
      metadata: match,
      nationalNumber: nationalNumber,
    );
  }
}
