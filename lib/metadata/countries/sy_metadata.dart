import '../../formatting/sy_formatter.dart';
import '../country_phone_metadata.dart';

const syriaMetadata = CountryPhoneMetadata(
  isoCode: 'SY',
  countryCode: '963',
  nationalPrefix: '0',
  validLengths: {9},
  mobilePrefixes: {
    '93',
    '94',
    '95',
    '96',
    '98',
    '99',
  },
  fixedLinePrefixes: {
    '11',
    '14',
    '15',
    '16',
    '21',
    '22',
    '23',
    '31',
    '33',
    '41',
    '43',
    '51',
    '52',
  },
  formatter: SyriaFormatter(),
);
