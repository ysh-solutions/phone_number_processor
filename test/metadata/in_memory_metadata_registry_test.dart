import 'package:phone_number_processor/metadata/in_memory_metadata_registry.dart';
import 'package:test/test.dart';

void main() {
  test('returns metadata version', () {
    expect(InMemoryMetadataRegistry.version.version, '2026.11');
  });

  test('contains egypt metadata', () {
    const registry = InMemoryMetadataRegistry();

    final metadata = registry.byIso('EG');

    expect(metadata, isNotNull);
  });
  test('contains US metadata', () {
    const registry = InMemoryMetadataRegistry();

    expect(registry.byIso('US'), isNotNull);
  });

  test('contains GB metadata', () {
    const registry = InMemoryMetadataRegistry();

    expect(registry.byIso('GB'), isNotNull);
  });
  test(
    'contains SA metadata',
    () {
      const registry = InMemoryMetadataRegistry();

      expect(
        registry.byIso('SA'),
        isNotNull,
      );
    },
  );
  test(
    'contains SY metadata',
    () {
      const registry = InMemoryMetadataRegistry();

      expect(
        registry.byIso('SY'),
        isNotNull,
      );
    },
  );
  test(
    'contains AE metadata',
    () {
      const registry = InMemoryMetadataRegistry();

      expect(
        registry.byIso('AE'),
        isNotNull,
      );
    },
  );
}
