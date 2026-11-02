/// Classification of a valid phone number.
enum PhoneNumberType {
  /// Mobile/cellular number.
  mobile,

  /// Fixed-line/landline number.
  fixedLine,

  /// Valid number whose type could not be determined.
  unknown,
}
