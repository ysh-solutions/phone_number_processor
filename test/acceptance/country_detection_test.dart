import 'package:phone_number_processor/classification/phone_number_classifier.dart';
import 'package:phone_number_processor/contracts/phone_number_processor.dart';
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
        lengthValidator: const LengthValidator(),
        prefixValidator: const PrefixValidator(),
        classifier: const PhoneNumberClassifier(),
      ),
      generator: const E164Generator(),
    );
  });

  test('detects GB from international code', () {
    final result = processor.process(
      '+447911123456',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.isValid, true);

    expect(result.country, 'GB');

    expect(result.countryCode, '44');
  });
  test('detects egypt from country code', () {
    final result = processor.process(
      '+201012345678',
      const PhoneOptions(defaultCountry: 'US'),
    );

    expect(result.isValid, true);

    expect(result.country, 'EG');

    expect(result.countryCode, '20');
  });

  test('returns invalid country code', () {
    final result = processor.process(
      '+999123456',
      const PhoneOptions(defaultCountry: 'EG'),
    );

    expect(result.isValid, false);

    expect(result.error, PhoneValidationError.invalidCountryCode);
  });
}
