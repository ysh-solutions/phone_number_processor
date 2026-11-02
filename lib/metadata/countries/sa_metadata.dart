import '../../formatting/sa_formatter.dart';
import '../country_phone_metadata.dart';

const saudiArabiaMetadata = CountryPhoneMetadata(
  isoCode: 'SA',
  countryCode: '966',
  nationalPrefix: '0',
  validLengths: {9},
  mobilePrefixes: {
    '50',
    '53',
    '54',
    '55',
    '56',
    '58',
    '59',
  },
  fixedLinePrefixes: {
    '11',
    '12',
    '13',
    '14',
    '16',
    '17',
  },
  formatter: SaudiFormatter(),
);
