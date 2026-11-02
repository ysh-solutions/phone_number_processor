import 'package:phone_number_processor/formatting/number_formatter.dart';

final class DummyFormatter implements NumberFormatter {
  const DummyFormatter();

  @override
  String format(String e164) => e164;
}