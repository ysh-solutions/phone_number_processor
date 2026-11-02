import 'package:phone_number_processor/contracts/phone_validation_error.dart';
import 'package:phone_number_processor/metadata/in_memory_metadata_registry.dart';
import 'package:phone_number_processor/metadata/metadata_registry.dart';
import 'package:phone_number_processor/resolver/country_resolver.dart';
import 'package:phone_number_processor/resolver/default_country_resolver.dart';
import 'package:test/test.dart';

void main() {
  late MetadataRegistry registry;
  late CountryResolver resolver;

  setUp(() {
    registry = const InMemoryMetadataRegistry();

    resolver = DefaultCountryResolver(registry);
  });

  test('resolves EG from default country', () {
    final result = resolver.resolve('01012345678', 'EG');

    expect(result.success, true);

    expect(result.metadata!.isoCode, 'EG');
  });

  test('resolves EG from +20', () {
    final result = resolver.resolve('+201012345678', 'US');

    expect(result.success, true);

    expect(result.metadata!.isoCode, 'EG');
  });

  test('returns invalid country code', () {
    final result = resolver.resolve('+999123456', 'EG');

    expect(result.error, PhoneValidationError.invalidCountryCode);
  });

  test('returns unsupported country', () {
    final result = resolver.resolve('01012345678', 'ZZ');

    expect(result.error, PhoneValidationError.unsupportedCountry);
  });
  test('local egypt number becomes national significant number', () {
    final result = resolver.resolve('01012345678', 'EG');

    expect(result.success, true);

    expect(result.nationalNumber, '1012345678');
  });

  test(
    'international egypt number becomes same national significant number',
    () {
      final result = resolver.resolve('+201012345678', 'US');

      expect(result.success, true);

      expect(result.nationalNumber, '1012345678');
    },
  );
}
