import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:countries_demo/common/constants/json_keys.dart';
import 'package:countries_demo/common/data/response_parser.dart';
import 'package:countries_demo/common/models/country.dart';

class CountryListParser extends ApiResponseParser<Iterable<Country>> {
  @override
  Iterable<Country> parse(Map<String, dynamic>? json) {
    final countries = json?[JsonKeys.countries] as List<dynamic>?;
    if (countries == null) return [];

    return countries.map((e) {
      if (e is! Map<String, dynamic>) return null;
      try {
        return Country.fromJson(e);
      } catch (exception) {
        log("Failed to parse country with json: $e", error: exception);
        return null;
      }
    }).whereNotNull();
  }

  @override
  List<Object?> get props => [];
}
