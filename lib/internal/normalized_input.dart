import '../contracts/phone_validation_error.dart';

final class NormalizedInput {
  final bool success;
  final String? value;
  final PhoneValidationError? error;

  const NormalizedInput._({
    required this.success,
    this.value,
    this.error,
  });

  factory NormalizedInput.success(String value) {
    return NormalizedInput._(
      success: true,
      value: value,
    );
  }

  factory NormalizedInput.failure(
    PhoneValidationError error,
  ) {
    return NormalizedInput._(
      success: false,
      error: error,
    );
  }
}