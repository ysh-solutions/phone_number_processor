import '../contracts/phone_validation_error.dart';
import '../internal/normalized_input.dart';
import 'input_normalizer.dart';

final class DefaultInputNormalizer implements InputNormalizer {
  const DefaultInputNormalizer();

  @override
  NormalizedInput normalize(String input) {
    final trimmed = input.trim();

    if (trimmed.isEmpty) {
      return NormalizedInput.failure(
        PhoneValidationError.emptyInput,
      );
    }

    final plusCount = '+'.allMatches(trimmed).length;

    if (plusCount > 1) {
      return NormalizedInput.failure(
        PhoneValidationError.invalidFormat,
      );
    }

    final plusIndex = trimmed.indexOf('+');

    if (plusIndex > 0) {
      return NormalizedInput.failure(
        PhoneValidationError.invalidFormat,
      );
    }

    if (trimmed == '+') {
      return NormalizedInput.failure(
        PhoneValidationError.invalidFormat,
      );
    }

    final unsupportedCharacters = RegExp(r'[^0-9+\-\(\)\s]');

    if (unsupportedCharacters.hasMatch(trimmed)) {
      return NormalizedInput.failure(
        PhoneValidationError.invalidCharacters,
      );
    }

    final normalized = trimmed
        .replaceAll(' ', '')
        .replaceAll('\t', '')
        .replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '');

    return NormalizedInput.success(
      normalized,
    );
  }
}
