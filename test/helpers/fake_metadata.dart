import 'package:phone_number_processor/metadata/country_phone_metadata.dart';

import 'dummy_formatter.dart';

const metadata1 = CountryPhoneMetadata(
  isoCode: 'A',
  countryCode: '1',
  nationalPrefix: '0',
  validLengths: {6},
  mobilePrefixes: {'9'},
  fixedLinePrefixes: {},
  formatter: DummyFormatter(),
);

const metadata12 = CountryPhoneMetadata(
  isoCode: 'B',
  countryCode: '12',
  nationalPrefix: '0',
  validLengths: {6},
  mobilePrefixes: {'9'},
  fixedLinePrefixes: {},
  formatter: DummyFormatter(),
);

const metadata123 = CountryPhoneMetadata(
  isoCode: 'C',
  countryCode: '123',
  nationalPrefix: '0',
  validLengths: {6},
  mobilePrefixes: {'9'},
  fixedLinePrefixes: {},
  formatter: DummyFormatter(),
);