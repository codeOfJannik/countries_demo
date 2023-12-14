import 'package:countries_demo/common/data/query.dart';
import 'package:countries_demo/features/country_list/data/country_list_query.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CountryDetailsQuery extends Equatable implements Query {
  final String countryCode;
  final Locale countryNameLanguage;

  const CountryDetailsQuery({
    required this.countryCode,
    this.countryNameLanguage = const Locale('en'),
  });

  @override
  String get gqlQuery => """
    query {
      country(code: "$countryCode") {
        continent {
          name
          code
          ${CountryListQuery(nameLanguage: countryNameLanguage).gplQueryContent}
        }
        languages {
          name
          native
          code
        }
        states {
          name
        }
        phones
      }
    }
  """;

  @override
  List<Object?> get props => [countryCode];
}
