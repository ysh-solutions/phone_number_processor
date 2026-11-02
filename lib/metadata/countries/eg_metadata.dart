import '../../formatting/egypt_formatter.dart';
import '../country_phone_metadata.dart';

const egyptMetadata = CountryPhoneMetadata(
  isoCode: 'EG',
  countryCode: '20',
  nationalPrefix: '0',
  validLengths: {10},
  mobilePrefixes: {
    '10',
    '11',
    '12',
    '15',
  },
  fixedLinePrefixes: {
    '2',
    '3',
  },
  formatter: EgyptFormatter(),
);
