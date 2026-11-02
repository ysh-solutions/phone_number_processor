import 'package:phone_number_processor/classification/phone_number_classifier.dart';
import 'package:phone_number_processor/contracts/phone_number_processor.dart';
import 'package:phone_number_processor/contracts/phone_number_type.dart';
import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/internal/e164_generator.dart';
import 'package:phone_number_processor/metadata/in_memory_metadata_registry.dart';
import 'package:phone_number_processor/normalizer/default_input_normalizer.dart';
import 'package:phone_number_processor/processor/default_phone_number_processor.dart';
import 'package:phone_number_processor/resolver/default_country_resolver.dart';
import 'package:phone_number_processor/validation/default_phone_validator.dart';
import 'package:phone_number_processor/validation/rules/length_validator.dart';
import 'package:phone_number_processor/validation/rules/prefix_validator.dart';
import 'package:test/test.dart';

void main() {
  late PhoneNumberProcessor processor;

  setUp(() {
    final registry = const InMemoryMetadataRegistry();

    processor = DefaultPhoneNumberProcessor(
      normalizer: const DefaultInputNormalizer(),
      resolver: DefaultCountryResolver(registry),
      validator: DefaultPhoneValidator(
        lengthValidator: LengthValidator(),
        prefixValidator: PrefixValidator(),
        classifier: PhoneNumberClassifier(),
      ),
      generator: const E164Generator(),
    );
  });

  test('validates egypt local mobile', () {
    final result = processor.process(
      '01012345678',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.isValid, true);

    expect(result.raw, '+201012345678');

    expect(result.formatted, '+20 10 1234 5678');

    expect(result.country, 'EG');
  });

  test('preserves original input', () {
    final result = processor.process(
      '+20 (10) 1234-5678',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.originalInput, '+20 (10) 1234-5678');
  });

  test('returns deterministic error', () {
    for (var i = 0; i < 1000; i++) {
      final result = processor.process(
        '++2010',
        const PhoneOptions(defaultCountry: 'EG'),
      );

      expect(result.error, PhoneValidationError.invalidFormat);
    }
  });
  test(
    'validates egypt fixed line number',
    () {
      final result = processor.process(
        '02123456789',
        const PhoneOptions(
          defaultCountry: 'EG',
        ),
      );

      expect(
        result.isValid,
        true,
      );

      expect(
        result.type,
        PhoneNumberType.fixedLine,
      );
    },
  );
}
