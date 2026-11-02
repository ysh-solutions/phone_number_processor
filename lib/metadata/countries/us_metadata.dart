import '../../formatting/us_formatter.dart';
import '../country_phone_metadata.dart';

const usMetadata = CountryPhoneMetadata(
  isoCode: 'US',
  countryCode: '1',
  nationalPrefix: '1',

  validLengths: {10},

  mobilePrefixes: {
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
  },

  fixedLinePrefixes: {},

  formatter: UsFormatter(),
);