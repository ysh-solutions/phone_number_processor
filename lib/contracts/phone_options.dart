/// Configuration options used when processing a phone number.
///
/// The processor uses [defaultCountry] whenever the supplied
/// input does not contain an international country code.
///
/// Example:
///
/// ```dart
/// const options = PhoneOptions(
///   defaultCountry: 'EG',
/// );
/// ```
final class PhoneOptions {
  /// ISO-3166 Alpha-2 country code.
  ///
  /// Examples:
  ///
  /// - EG
  /// - US
  /// - GB
  final String defaultCountry;

  /// Creates a new set of phone processing options.
  const PhoneOptions({
    required this.defaultCountry,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PhoneOptions &&
            runtimeType == other.runtimeType &&
            defaultCountry == other.defaultCountry;
  }

  @override
  int get hashCode => defaultCountry.hashCode;
}
