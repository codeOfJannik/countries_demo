import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:countries_demo/common/models/country.dart';

class CountryInfo extends Country {
  final String nativeName;
  final String? capital;
  final String? currency;

  CountryInfo(
      {required this.nativeName,
      required this.capital,
      required this.currency,
      required super.code,
      required super.name,
      required super.flagEmoji});

  factory CountryInfo.forCountryWithJson(
      Country country, Map<String, dynamic> json) {
    return CountryInfo(
      nativeName: json[JsonKeys.native] as String,
      capital: json[JsonKeys.capital] as String?,
      currency: json[JsonKeys.currency] as String?,
      code: country.code,
      name: country.name,
      flagEmoji: country.flagEmoji,
    );
  }

  @override
  List<Object?> get props => [...super.props, nativeName, capital, currency];
}
