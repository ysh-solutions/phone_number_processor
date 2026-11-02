import 'package:phone_number_processor/classification/phone_number_classifier.dart';
import 'package:phone_number_processor/internal/e164_generator.dart';
import 'package:phone_number_processor/metadata/in_memory_metadata_registry.dart';
import 'package:phone_number_processor/normalizer/default_input_normalizer.dart';
import 'package:phone_number_processor/processor/default_phone_number_processor.dart';
import 'package:phone_number_processor/resolver/default_country_resolver.dart';
import 'package:phone_number_processor/validation/default_phone_validator.dart';
import 'package:phone_number_processor/validation/rules/length_validator.dart';
import 'package:phone_number_processor/validation/rules/prefix_validator.dart';

DefaultPhoneNumberProcessor buildProcessor() {
  final registry =
      const InMemoryMetadataRegistry();

  return DefaultPhoneNumberProcessor(
    normalizer:
        const DefaultInputNormalizer(),

    resolver:
        DefaultCountryResolver(
      registry,
    ),

    validator:
        const DefaultPhoneValidator(
      lengthValidator:
          LengthValidator(),
      prefixValidator:
          PrefixValidator(),
      classifier:
          PhoneNumberClassifier(),
    ),

    generator:
        const E164Generator(),
  );
}