import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_list/data/country_list_parser.dart';
import 'package:countries_demo/features/country_list/data/country_list_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "country_list_provider.g.dart";

@riverpod
class CountryList extends _$CountryList {
  @override
  Future<List<Country>> build() async {
    final api = ref.watch(gqlCountryApiProvider);

    final language = ref.watch(selectedLocaleProvider);
    final response = await api.query(
      CountryListQuery(nameLanguage: language),
      parser: CountryListParser(),
    );

    return response.parsedData?.toList() ?? [];
  }
}
