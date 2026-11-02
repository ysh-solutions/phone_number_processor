import 'number_formatter.dart';

final class GbFormatter implements NumberFormatter {
  const GbFormatter();

  @override
  String format(String e164) {
    final n = e164.substring(3);

    return '+44 '
        '${n.substring(0, 2)} '
        '${n.substring(2, 6)} '
        '${n.substring(6)}';
  }
}
