import 'package:phone_number_processor/formatting/gb_formatter.dart';
import 'package:test/test.dart';

void main() {
  test(
    'formats GB number',
    () {
      const formatter = GbFormatter();

      expect(
        formatter.format(
          '+447911123456',
        ),
        '+44 79 1112 3456',
      );
    },
  );
}
