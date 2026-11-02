import '../../formatting/gb_formatter.dart';
import '../country_phone_metadata.dart';

const gbMetadata = CountryPhoneMetadata(
  isoCode: 'GB',
  countryCode: '44',
  nationalPrefix: '0',
  validLengths: {10},
  mobilePrefixes: {
    '7',
  },
  fixedLinePrefixes: {
    '1',
    '2',
  },
  formatter: GbFormatter(),
);
