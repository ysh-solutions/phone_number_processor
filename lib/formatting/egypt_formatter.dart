import 'number_formatter.dart';

final class EgyptFormatter implements NumberFormatter {
  const EgyptFormatter();

  @override
  String format(String e164) {
    final national = e164.substring(3);

    return '+20 '
        '${national.substring(0, 2)} '
        '${national.substring(2, 6)} '
        '${national.substring(6)}';
  }
}
