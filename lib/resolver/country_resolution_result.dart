import '../contracts/phone_validation_error.dart';
import '../metadata/country_phone_metadata.dart';

final class CountryResolutionResult {
  final bool success;

  final CountryPhoneMetadata? metadata;

  final String? nationalNumber;

  final PhoneValidationError? error;

  const CountryResolutionResult._({
    required this.success,
    this.metadata,
    this.nationalNumber,
    this.error,
  });

  factory CountryResolutionResult.success({
    required CountryPhoneMetadata metadata,
    required String nationalNumber,
  }) {
    return CountryResolutionResult._(
      success: true,
      metadata: metadata,
      nationalNumber: nationalNumber,
    );
  }

  factory CountryResolutionResult.failure(
    PhoneValidationError error,
  ) {
    return CountryResolutionResult._(
      success: false,
      error: error,
    );
  }
}
