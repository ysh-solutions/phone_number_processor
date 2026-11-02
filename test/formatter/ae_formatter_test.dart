import 'package:test/test.dart';
import 'package:phone_number_processor/formatting/ae_formatter.dart';

void main() {
  test(
    'formats uae mobile',
    () {
      const formatter = UaeFormatter();

      expect(
        formatter.format(
          '+971501234567',
        ),
        '+971 50 123 4567',
      );
    },
  );
}
