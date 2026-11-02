import 'phone_options.dart';
import 'phone_validation_result.dart';

/// Validates, normalizes and formats phone numbers.
abstract interface class PhoneNumberProcessor {
  /// Processes the supplied phone number.
  ///
  /// Never throws for invalid user input.
  PhoneValidationResult process(
    String input,
    PhoneOptions options,
  );
}
