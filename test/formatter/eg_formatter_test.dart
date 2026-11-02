import 'package:phone_number_processor/formatting/eg_formatter.dart';
import 'package:test/test.dart';

void main() {
  test('formats egyptian number', () {
    const formatter = EgyptFormatter();

    expect(formatter.format('+201012345678'), '+20 10 1234 5678');
  });
}
