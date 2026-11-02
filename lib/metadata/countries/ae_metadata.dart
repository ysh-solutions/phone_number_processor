import '../../formatting/ae_formatter.dart';
import '../country_phone_metadata.dart';

const unitedArabEmiratesMetadata = CountryPhoneMetadata(
  isoCode: 'AE',
  countryCode: '971',
  nationalPrefix: '0',
  validLengths: {9},
  mobilePrefixes: {
    '50',
    '52',
    '54',
    '55',
    '56',
    '58',
  },
  fixedLinePrefixes: {
    '2',
    '3',
    '4',
    '6',
    '7',
    '9',
  },
  formatter: UaeFormatter(),
);
