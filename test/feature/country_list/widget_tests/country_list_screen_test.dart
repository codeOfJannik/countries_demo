import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_list/country_list_constants.dart';
import 'package:countries_demo/features/country_list/data/country_list_provider.dart';
import 'package:countries_demo/features/country_list/presentation/components/country_list_view.dart';
import 'package:countries_demo/features/country_list/presentation/country_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_utils.dart';

class MockCountryList extends Mock implements CountryList {}

void main() {
  late CountryList mockCountryList;

  setUp(() {
    mockCountryList = MockCountryList();
  });

  testWidgets('CountryListScreen displays loading indicator',
      (WidgetTester tester) async {
    when(() => mockCountryList.state).thenAnswer((_) => AsyncLoading());
    await tester.pumpWidget(setupTestWidget(
      child: CountryListScreen(),
      overrides: [
        countryListProvider.overrideWith(() => mockCountryList),
      ],
    ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(
        find.byKey(CountryListConstants.loadingIndicatorKey), findsOneWidget);
  });

  testWidgets('CountryListScreen displays error message',
      (WidgetTester tester) async {
    when(() => mockCountryList.state)
        .thenAnswer((_) => AsyncError('error', StackTrace.current));
    await tester.pumpWidget(setupTestWidget(
      child: CountryListScreen(),
      overrides: [
        countryListProvider.overrideWith(() => mockCountryList),
      ],
    ));

    expect(find.text('error'), findsOneWidget);
    expect(find.byKey(CountryListConstants.errorTextKey), findsOneWidget);
  });

  testWidgets('CountryListScreen displays country list',
      (WidgetTester tester) async {
    when(() => mockCountryList.state).thenAnswer((_) => AsyncData([
          Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
        ]));
    await tester.pumpWidget(setupTestWidget(
      child: CountryListScreen(),
      overrides: [
        countryListProvider.overrideWith(() => mockCountryList),
      ],
    ));

    expect(find.byType(CountryListView), findsOneWidget);
  });
}
