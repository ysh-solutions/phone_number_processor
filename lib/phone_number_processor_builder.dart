import 'package:phone_number_processor/contracts/phone_number_processor.dart';

import 'classification/phone_number_classifier.dart';
import 'internal/e164_generator.dart';
import 'metadata/in_memory_metadata_registry.dart';
import 'normalizer/default_input_normalizer.dart';
import 'processor/default_phone_number_processor.dart';
import 'resolver/default_country_resolver.dart';
import 'validation/default_phone_validator.dart';
import 'validation/rules/length_validator.dart';
import 'validation/rules/prefix_validator.dart';

final class PhoneNumberProcessorBuilder {
  const PhoneNumberProcessorBuilder._();

  static PhoneNumberProcessor build() {
    final registry = const InMemoryMetadataRegistry();

    return DefaultPhoneNumberProcessor(
      normalizer: const DefaultInputNormalizer(),

      resolver: DefaultCountryResolver(registry),

      validator: const DefaultPhoneValidator(
        lengthValidator: LengthValidator(),
        prefixValidator: PrefixValidator(),
        classifier: PhoneNumberClassifier(),
      ),

      generator: const E164Generator(),
    );
  }
}
