import 'package:phone_number_processor/contracts/phone_options.dart';
import 'package:test/test.dart';

void main() {
  test('equal objects are equal', () {
    expect(
      const PhoneOptions(
        defaultCountry: 'EG',
      ),
      const PhoneOptions(
        defaultCountry: 'EG',
      ),
    );
  });

  test('different objects are not equal', () {
    expect(
      const PhoneOptions(
        defaultCountry: 'EG',
      ),
      isNot(
        const PhoneOptions(
          defaultCountry: 'US',
        ),
      ),
    );
  });
}
