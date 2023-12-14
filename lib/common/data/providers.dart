import 'package:countries_demo/common/data/gql_country_api.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@riverpod
GqlCountryApi gqlCountryApi(GqlCountryApiRef ref) => GqlCountryApi();

@riverpod
class SelectedLocale extends _$SelectedLocale {
  @override
  Locale build() {
    return S.delegate.supportedLocales.first;
  }

  @override
  set state(Locale locale) {
    super.state = locale;
  }
}
