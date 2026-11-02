import 'package:phone_number_processor/resolver/default_country_resolver.dart';
import 'package:test/test.dart';

import '../helpers/fake_metadata.dart';
import '../helpers/fake_registry.dart';

void main() {
  test('prefers longest matching country code', () {
    // Arrange
    final registry = FakeRegistry([metadata1, metadata12, metadata123]);

    final resolver = DefaultCountryResolver(registry);

    // Act
    final result = resolver.resolve('+123999999', 'EG');

    // Assert
    expect(result.success, true);

    expect(result.metadata!.countryCode, '123');
  });
}
