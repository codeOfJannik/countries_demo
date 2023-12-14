import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/data/parser/country_info_parser.dart';
import 'package:countries_demo/features/country_detail/data/queries/country_info_query.dart';
import 'package:countries_demo/features/country_detail/model/country_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'country_info_provider.g.dart';

@riverpod
Future<CountryInfo> countryInfo(CountryInfoRef ref, Country country) async {
  final api = ref.watch(gqlCountryApiProvider);
  final result = await api.query(
    CountryInfoQuery(countryCode: country.code),
    parser: CountryInfoParser(country),
  );

  final countryInfo = result.parsedData;
  if (countryInfo == null) {
    throw Exception('Failed to load country info for ${country.name}');
  }

  return countryInfo;
}
