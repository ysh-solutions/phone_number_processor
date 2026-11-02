import 'number_formatter.dart';

final class SaudiFormatter implements NumberFormatter {
  const SaudiFormatter();

  @override
  String format(String e164) {
    if (!e164.startsWith('+966')) {
      return e164;
    }

    final nationalNumber = e164.substring(4);

    return '+966 '
        '${nationalNumber.substring(0, 2)} '
        '${nationalNumber.substring(2, 5)} '
        '${nationalNumber.substring(5)}';
  }
}
