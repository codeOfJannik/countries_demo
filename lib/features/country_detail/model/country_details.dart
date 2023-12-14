import 'package:collection/collection.dart';
import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:countries_demo/common/models/continent.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/common/models/language.dart';

class CountryDetails extends Country {
  CountryDetails(
      {required this.continent,
      required this.languages,
      required this.states,
      required this.phoneCodes,
      required super.code,
      required super.name,
      required super.flagEmoji});

  final Continent continent;
  final Iterable<Language> languages;
  final Iterable<String> states;
  final Iterable<String> phoneCodes;

  factory CountryDetails.forCountryWithJson(
    Country country,
    Map<String, dynamic> json,
  ) {
    final continent =
        Continent.fromJson(json[JsonKeys.continent] as Map<String, dynamic>);
    final languages = (json[JsonKeys.languages] as List<dynamic>)
        .map((e) => Language.fromJson(e as Map<String, dynamic>));
    final states = (json[JsonKeys.states] as List<dynamic>).map((data) {
      if (data is! Map<String, dynamic>) return null;
      return data[JsonKeys.name] as String?;
    }).whereNotNull();
    final phoneCodes = (json[JsonKeys.phones] as List).whereType<String>();

    return CountryDetails(
      continent: continent,
      languages: languages,
      states: states,
      phoneCodes: phoneCodes,
      code: country.code,
      name: country.name,
      flagEmoji: country.flagEmoji,
    );
  }

  @override
  List<Object?> get props =>
      [...super.props, continent, languages, states, phoneCodes];
}
