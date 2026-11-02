import '../contracts/phone_options.dart';
import '../contracts/phone_number_processor.dart';
import '../contracts/phone_validation_result.dart';

import '../internal/e164_generator.dart';

import '../normalizer/input_normalizer.dart';
import '../resolver/country_resolver.dart';

import '../validation/phone_validator.dart';
import '../validation/phone_validation_context.dart';

final class DefaultPhoneNumberProcessor implements PhoneNumberProcessor {
  final InputNormalizer normalizer;

  final CountryResolver resolver;

  final PhoneValidator validator;

  final E164Generator generator;

  const DefaultPhoneNumberProcessor({
    required this.normalizer,
    required this.resolver,
    required this.validator,
    required this.generator,
  });

  @override
  PhoneValidationResult process(
    String input,
    PhoneOptions options,
  ) {
    final normalized = normalizer.normalize(input);

    if (!normalized.success) {
      return PhoneValidationResult.invalid(
        originalInput: input,
        error: normalized.error!,
      );
    }

    final resolution = resolver.resolve(
      normalized.value!,
      options.defaultCountry,
    );

    if (!resolution.success) {
      return PhoneValidationResult.invalid(
        originalInput: input,
        error: resolution.error!,
      );
    }

    final validation = validator.validate(
      PhoneValidationContext(
        metadata: resolution.metadata!,
        nationalNumber: resolution.nationalNumber!,
      ),
    );

    if (!validation.valid) {
      return PhoneValidationResult.invalid(
        originalInput: input,
        error: validation.error!,
      );
    }

    final raw = generator.generate(
      metadata: resolution.metadata!,
      nationalNumber: resolution.nationalNumber!,
    );

    final formatted = resolution.metadata!.formatter.format(raw);

    return PhoneValidationResult.valid(
      originalInput: input,
      raw: raw,
      formatted: formatted,
      country: resolution.metadata!.isoCode,
      countryCode: resolution.metadata!.countryCode,
      type: validation.type!,
    );
  }
}
