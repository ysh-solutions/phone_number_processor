/// Error codes produced during phone number validation.
///
/// Validation errors are deterministic:
/// the same input must always produce the same error.
enum PhoneValidationError {
  /// Input was empty or contained only whitespace.
  emptyInput,

  /// The configured default country is not supported.
  unsupportedCountry,

  /// Input contains unsupported characters.
  ///
  /// Examples:
  ///
  /// - abc123
  /// - +20A1012345678
  /// - +201012345678 ext 123
  invalidCharacters,

  /// International country code could not be resolved.
  ///
  /// Example:
  ///
  /// - +999123456
  invalidCountryCode,

  /// Number length is not part of the allowed length set.
  invalidLength,

  /// Number is shorter than the minimum supported length.
  tooShort,

  /// Number exceeds the maximum supported length.
  tooLong,

  /// Input violates formatting rules.
  ///
  /// Examples:
  ///
  /// - ++201012345678
  /// - 20+1012345678
  /// - +
  invalidFormat,

  /// National prefix validation failed.
  invalidNationalPrefix,

  /// Number does not match any supported numbering pattern.
  numberNotAllowed,
}
