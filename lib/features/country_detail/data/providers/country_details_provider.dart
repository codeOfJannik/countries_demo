import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/data/parser/country_detail_parser.dart';
import 'package:countries_demo/features/country_detail/data/queries/country_details_query.dart';
import 'package:countries_demo/features/country_detail/model/country_details.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "country_details_provider.g.dart";

@riverpod
Future<CountryDetails> countryDetails(
  CountryDetailsRef ref,
  Country country,
) async {
  final api = ref.watch(gqlCountryApiProvider);
  final language = ref.watch(selectedLocaleProvider);
  final result = await api.query(
    CountryDetailsQuery(
      countryCode: country.code,
      countryNameLanguage: language,
    ),
    parser: CountryDetailParser(country),
  );

  final countryDetails = result.parsedData;
  if (countryDetails == null) {
    throw Exception('Failed to load country details for ${country.name}');
  }

  return countryDetails;
}
