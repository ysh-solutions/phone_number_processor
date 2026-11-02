import 'package:collection/collection.dart';

import '../formatting/number_formatter.dart';

/// Phone numbering metadata for a specific country.
///
/// This class contains country-specific rules only.
///
/// Important:
/// Validation logic should never exist inside metadata.
/// Metadata describes rules.
/// Validators execute rules.
final class CountryPhoneMetadata {
  /// ISO-3166 Alpha-2 country code.
  ///
  /// Examples:
  ///
  /// - EG
  /// - US
  /// - GB
  final String isoCode;

  /// International country calling code.
  ///
  /// Examples:
  ///
  /// - 20
  /// - 1
  /// - 44
  final String countryCode;

  /// National trunk prefix used in local dialing.
  ///
  /// Example:
  ///
  /// Egypt:
  ///
  /// ```text
  /// 01012345678
  /// ^
  /// trunk prefix
  /// ```
  final String nationalPrefix;

  /// Supported national significant number lengths.
  ///
  /// Example:
  ///
  /// ```dart
  /// {10}
  /// ```
  final Set<int> validLengths;

  /// Supported mobile number prefixes.
  ///
  /// Example:
  ///
  /// ```dart
  /// {'10', '11', '12', '15'}
  /// ```
  final Set<String> mobilePrefixes;

  /// Supported fixed-line number prefixes.
  final Set<String> fixedLinePrefixes;

  /// Formatter responsible for rendering
  /// human-readable output.
  final NumberFormatter formatter;

  /// Creates immutable country phone metadata.
  const CountryPhoneMetadata({
    required this.isoCode,
    required this.countryCode,
    required this.nationalPrefix,
    required this.validLengths,
    required this.mobilePrefixes,
    required this.fixedLinePrefixes,
    required this.formatter,
  });
  static const _setEquality = SetEquality();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is CountryPhoneMetadata &&
            isoCode == other.isoCode &&
            countryCode == other.countryCode &&
            nationalPrefix == other.nationalPrefix &&
            _setEquality.equals(
              validLengths,
              other.validLengths,
            ) &&
            _setEquality.equals(
              mobilePrefixes,
              other.mobilePrefixes,
            ) &&
            _setEquality.equals(
              fixedLinePrefixes,
              other.fixedLinePrefixes,
            );
  }

  @override
  int get hashCode => Object.hash(
        isoCode,
        countryCode,
        nationalPrefix,
        _setEquality.hash(validLengths),
        _setEquality.hash(mobilePrefixes),
        _setEquality.hash(fixedLinePrefixes),
      );
}
