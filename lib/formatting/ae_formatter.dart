import 'number_formatter.dart';

final class UaeFormatter implements NumberFormatter {
  const UaeFormatter();

  @override
  String format(String e164) {
    if (!e164.startsWith('+971')) {
      return e164;
    }

    final nationalNumber = e164.substring(4);

    return '+971 '
        '${nationalNumber.substring(0, 2)} '
        '${nationalNumber.substring(2, 5)} '
        '${nationalNumber.substring(5)}';
  }
}
