import 'package:phone_number_processor/internal/e164_generator.dart';
import 'package:phone_number_processor/metadata/countries/eg_metadata.dart';
import 'package:test/test.dart';

void main() {
  test('creates e164 output', () {
    const generator = E164Generator();

    final result = generator.generate(
      metadata: egyptMetadata,
      nationalNumber: '1012345678',
    );

    expect(result, '+201012345678');
  });
}
