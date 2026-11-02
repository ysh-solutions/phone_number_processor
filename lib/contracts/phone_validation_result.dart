import 'phone_number_type.dart';
import 'phone_validation_error.dart';

/// Result returned by a phone number processing operation.
///
/// A result is either valid or invalid.
///
/// ## Valid Result Invariants
///
/// When [isValid] is `true`:
///
/// - [raw] is not null
/// - [formatted] is not null
/// - [country] is not null
/// - [countryCode] is not null
/// - [type] is not null
/// - [error] is null
///
/// ## Invalid Result Invariants
///
/// When [isValid] is `false`:
///
/// - [error] is not null
final class PhoneValidationResult {
  /// Indicates whether the phone number passed validation.
  final bool isValid;

  /// Original user-supplied input.
  ///
  /// This value is preserved exactly as received.
  final String originalInput;

  /// Canonical E.164-style representation.
  ///
  /// Example:
  ///
  /// ```text
  /// +201012345678
  /// ```
  final String? raw;

  /// Human-readable formatted representation.
  ///
  /// Example:
  ///
  /// ```text
  /// +20 10 1234 5678
  /// ```
  final String? formatted;

  /// ISO-3166 Alpha-2 country code.
  ///
  /// Examples:
  ///
  /// - EG
  /// - US
  /// - GB
  final String? country;

  /// International country dialing code.
  ///
  /// Examples:
  ///
  /// - 20
  /// - 1
  /// - 44
  final String? countryCode;

  /// Classified phone number type.
  final PhoneNumberType? type;

  /// Validation error when processing fails.
  final PhoneValidationError? error;

  const PhoneValidationResult._({
    required this.isValid,
    required this.originalInput,
    this.raw,
    this.formatted,
    this.country,
    this.countryCode,
    this.type,
    this.error,
  });

  /// Creates a successful validation result.
  factory PhoneValidationResult.valid({
    required String originalInput,
    required String raw,
    required String formatted,
    required String country,
    required String countryCode,
    required PhoneNumberType type,
  }) {
    return PhoneValidationResult._(
      isValid: true,
      originalInput: originalInput,
      raw: raw,
      formatted: formatted,
      country: country,
      countryCode: countryCode,
      type: type,
    );
  }

  /// Creates a failed validation result.
  factory PhoneValidationResult.invalid({
    required String originalInput,
    required PhoneValidationError error,
  }) {
    return PhoneValidationResult._(
      isValid: false,
      originalInput: originalInput,
      error: error,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PhoneValidationResult &&
            runtimeType == other.runtimeType &&
            isValid == other.isValid &&
            originalInput == other.originalInput &&
            raw == other.raw &&
            formatted == other.formatted &&
            country == other.country &&
            countryCode == other.countryCode &&
            type == other.type &&
            error == other.error;
  }

  @override
  int get hashCode => Object.hash(
        isValid,
        originalInput,
        raw,
        formatted,
        country,
        countryCode,
        type,
        error,
      );
}
