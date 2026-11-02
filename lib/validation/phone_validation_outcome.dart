import '../contracts/phone_number_type.dart';
import '../contracts/phone_validation_error.dart';

final class PhoneValidationOutcome {
  final bool valid;

  final PhoneNumberType? type;

  final PhoneValidationError? error;

  const PhoneValidationOutcome._({
    required this.valid,
    this.type,
    this.error,
  });

  factory PhoneValidationOutcome.valid(
    PhoneNumberType type,
  ) {
    return PhoneValidationOutcome._(
      valid: true,
      type: type,
    );
  }

  factory PhoneValidationOutcome.invalid(
    PhoneValidationError error,
  ) {
    return PhoneValidationOutcome._(
      valid: false,
      error: error,
    );
  }
}