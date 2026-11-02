import 'phone_validation_context.dart';
import 'phone_validation_outcome.dart';

abstract interface class PhoneValidator {
  PhoneValidationOutcome validate(
    PhoneValidationContext context,
  );
}