import 'package:phone_number_processor/formatting/sa_formatter.dart';
import 'package:test/test.dart';

void main() {
  test(
    'formats saudi mobile',
    () {
      const formatter = SaudiFormatter();

      expect(
        formatter.format(
          '+966501234567',
        ),
        '+966 50 123 4567',
      );
    },
  );
}
