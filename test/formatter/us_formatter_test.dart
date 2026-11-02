import 'package:phone_number_processor/formatting/us_formatter.dart';
import 'package:test/test.dart';

void main() {
  test(
    'formats US number',
    () {
      const formatter = UsFormatter();

      expect(
        formatter.format(
          '+12025551234',
        ),
        '+1 (202) 555-1234',
      );
    },
  );
}
