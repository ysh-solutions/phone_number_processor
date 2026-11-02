import 'package:test/test.dart';
import 'package:phone_number_processor/formatting/sy_formatter.dart';

void main() {
  test(
    'formats syrian mobile',
    () {
      const formatter = SyriaFormatter();

      expect(
        formatter.format(
          '+963944123456',
        ),
        '+963 94 412 3456',
      );
    },
  );
}
