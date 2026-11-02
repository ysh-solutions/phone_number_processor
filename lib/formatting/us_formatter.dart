import 'number_formatter.dart';

final class UsFormatter implements NumberFormatter {
  const UsFormatter();

  @override
  String format(String e164) {
    final n = e164.substring(2);

    return '+1 '
        '(${n.substring(0, 3)}) '
        '${n.substring(3, 6)}-'
        '${n.substring(6)}';
  }
}
