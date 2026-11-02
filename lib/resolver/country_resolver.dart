import 'country_resolution_result.dart';

abstract interface class CountryResolver {
  CountryResolutionResult resolve(
    String normalizedInput,
    String defaultCountry,
  );
}
