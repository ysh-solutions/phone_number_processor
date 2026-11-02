import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/normalizer/default_input_normalizer.dart';
import 'package:test/test.dart';

void main() {
  group('Input Normalizer', () {
    const normalizer = DefaultInputNormalizer();

    test('removes spaces', () {
      final result = normalizer.normalize('+20 10 1234 5678');

      expect(result.success, true);
      expect(result.value, '+201012345678');
    });

    test('removes parentheses', () {
      final result = normalizer.normalize('+20 (10) 1234 5678');

      expect(result.value, '+201012345678');
    });

    test('removes hyphens', () {
      final result = normalizer.normalize('+20-10-1234-5678');

      expect(result.value, '+201012345678');
    });

    test('rejects multiple pluses', () {
      final result = normalizer.normalize('++201012345678');

      expect(result.error, PhoneValidationError.invalidFormat);
    });

    test('rejects plus in middle', () {
      final result = normalizer.normalize('20+1012345678');

      expect(result.error, PhoneValidationError.invalidFormat);
    });

    test('rejects letters', () {
      final result = normalizer.normalize('+20A1012345678');

      expect(result.error, PhoneValidationError.invalidCharacters);
    });

    test('rejects empty string', () {
      final result = normalizer.normalize(' ');

      expect(result.error, PhoneValidationError.emptyInput);
    });
  });
}
