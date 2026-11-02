import 'package:phone_number_processor/phone_number_processor.dart';

void main() {
  final processor = PhoneNumberProcessorBuilder.build();

  final result = processor.process(
    '01012345678',
    const PhoneOptions(defaultCountry: 'EG'),
  );

  print('Valid: ${result.isValid}');
  print('Raw: ${result.raw}');
  print('Formatted: ${result.formatted}');
}
