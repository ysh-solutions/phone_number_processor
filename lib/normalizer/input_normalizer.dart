import '../internal/normalized_input.dart';

abstract interface class InputNormalizer {
  NormalizedInput normalize(String input);
}