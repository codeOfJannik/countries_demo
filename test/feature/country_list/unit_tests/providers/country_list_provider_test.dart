import 'package:countries_demo/common/data/gql_country_api.dart';
import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_list/data/country_list_parser.dart';
import 'package:countries_demo/features/country_list/data/country_list_provider.dart';
import 'package:countries_demo/features/country_list/data/country_list_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql/client.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_utils.dart';

class _MockGqlCountryApi extends Mock implements GqlCountryApi {}

class _MockQueryResult<T> extends Mock implements QueryResult<T> {}

void main() {
  late GqlCountryApi mockGqlCountryApi;
  late QueryResult<Iterable<Country>> mockQueryResult;

  setUp(() {
    mockGqlCountryApi = _MockGqlCountryApi();
    mockQueryResult = _MockQueryResult();
  });

  void setupMockedResponses(List<Country>? mockedCountryResponse) {
    when(() => mockQueryResult.parsedData).thenReturn(mockedCountryResponse);
    when(() => mockGqlCountryApi.query(
          CountryListQuery(nameLanguage: Locale("en")),
          parser: CountryListParser(),
        )).thenAnswer((_) => Future.value(mockQueryResult));
  }

  test("Test api providers query method is called with correct parameters", () {
    setupMockedResponses([]);
    final container = createContainer(overrides: [
      gqlCountryApiProvider.overrideWith((ref) => mockGqlCountryApi),
    ]);
    container.read(selectedLocaleProvider.notifier).state = Locale("en");
    container.read(countryListProvider.future);
    verify(() => mockGqlCountryApi.query(
          CountryListQuery(nameLanguage: Locale("en")),
          parser: CountryListParser(),
        ));
  });

  test("Test country list provider returns empty list", () async {
    setupMockedResponses([]);

    final container = createContainer(overrides: [
      gqlCountryApiProvider.overrideWith((ref) => mockGqlCountryApi),
    ]);
    container.read(selectedLocaleProvider.notifier).state = Locale("en");
    await expectLater(
        container.read(countryListProvider.future), completion([]));
  });

  test("Test country list provider returns list of countries for single result",
      () async {
    setupMockedResponses([
      Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
    ]);
    final container = createContainer(overrides: [
      gqlCountryApiProvider.overrideWith((ref) => mockGqlCountryApi),
    ]);
    container.read(selectedLocaleProvider.notifier).state = Locale("en");
    await expectLater(
        container.read(countryListProvider.future), completion(isNotEmpty));
    await expectLater(container.read(countryListProvider.future),
        completion([Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪")]));
  });

  test(
      "Test country list provider returns list of countries for multiple results",
      () async {
    setupMockedResponses([
      Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
      Country(code: "FR", name: "France", flagEmoji: "🇫🇷"),
      Country(code: "US", name: "United States of America", flagEmoji: "🇺🇸")
    ]);
    final container = createContainer(overrides: [
      gqlCountryApiProvider.overrideWith((ref) => mockGqlCountryApi),
    ]);
    container.read(selectedLocaleProvider.notifier).state = Locale("en");
    await expectLater(
        container.read(countryListProvider.future), completion(isNotEmpty));
    await expectLater(
        container.read(countryListProvider.future),
        completion([
          Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
          Country(code: "FR", name: "France", flagEmoji: "🇫🇷"),
          Country(
              code: "US", name: "United States of America", flagEmoji: "🇺🇸")
        ]));
  });

  test("Test country list provider returns empty list if parsed data is null",
      () async {
    setupMockedResponses(null);
    final container = createContainer(overrides: [
      gqlCountryApiProvider.overrideWith((ref) => mockGqlCountryApi),
    ]);
    container.read(selectedLocaleProvider.notifier).state = Locale("en");
    await expectLater(
        container.read(countryListProvider.future), completion([]));
  });
}
