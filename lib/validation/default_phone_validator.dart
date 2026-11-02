import 'package:phone_number_processor/classification/phone_number_classifier.dart';
import 'package:phone_number_processor/validation/phone_validation_context.dart';
import 'package:phone_number_processor/validation/phone_validation_outcome.dart';
import 'package:phone_number_processor/validation/phone_validator.dart';
import 'package:phone_number_processor/validation/rules/length_validator.dart';
import 'package:phone_number_processor/validation/rules/prefix_validator.dart';

final class DefaultPhoneValidator implements PhoneValidator {
  final LengthValidator lengthValidator;

  final PrefixValidator prefixValidator;

  final PhoneNumberClassifier classifier;

  const DefaultPhoneValidator({
    required this.lengthValidator,
    required this.prefixValidator,
    required this.classifier,
  });

  @override
  PhoneValidationOutcome validate(PhoneValidationContext context) {
    final lengthError = lengthValidator.validate(
      context.metadata,
      context.nationalNumber,
    );

    if (lengthError != null) {
      return PhoneValidationOutcome.invalid(lengthError);
    }

    final prefixError = prefixValidator.validate(
      context.metadata,
      context.nationalNumber,
    );

    if (prefixError != null) {
      return PhoneValidationOutcome.invalid(prefixError);
    }

    final type = classifier.classify(context.metadata, context.nationalNumber);

    return PhoneValidationOutcome.valid(type);
  }
}
