import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:countries_demo/common/data/response_parser.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/model/country_details.dart';

class CountryDetailParser extends ApiResponseParser<CountryDetails?> {
  CountryDetailParser(this.country);
  final Country country;
  @override
  CountryDetails? parse(Map<String, dynamic>? json) {
    final countryData = json?[JsonKeys.country] as Map<String, dynamic>?;
    if (countryData == null) return null;
    return CountryDetails.forCountryWithJson(country, countryData);
  }

  @override
  List<Object?> get props => [country];
}
