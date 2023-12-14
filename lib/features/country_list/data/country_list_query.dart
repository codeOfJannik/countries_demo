import 'package:countries_demo/common/data/query.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CountryListQuery extends Equatable implements Query {
  final Locale nameLanguage;

  const CountryListQuery({this.nameLanguage = const Locale('en')});

  String get gplQueryContent => """
    countries {
        code
        name(lang: "${nameLanguage.languageCode}")
        emoji
      }
  """;

  @override
  String get gqlQuery => """
    query {
      $gplQueryContent
    }
  """;

  @override
  List<Object?> get props => [nameLanguage];
}
