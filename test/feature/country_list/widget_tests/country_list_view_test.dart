import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_list/presentation/components/country_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';

void main() {
  testWidgets('Shows no list tiles when no countries are available',
      (WidgetTester tester) async {
    final widget = setupTestWidget(child: CountryListView(countries: []));
    await tester.pumpWidget(widget);

    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Shows list tile when one countries are available',
      (WidgetTester tester) async {
    final widget = setupTestWidget(
      child: Material(
        child: CountryListView(
          countries: [
            Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
          ],
        ),
      ),
    );
    await tester.pumpWidget(widget);
    expect(find.byType(ListTile), findsOneWidget);
  });

  testWidgets('Shows list tile when multiple countries are available',
      (WidgetTester tester) async {
    final widget = setupTestWidget(
      child: Material(
        child: CountryListView(
          countries: [
            Country(code: "DE", name: "Germany", flagEmoji: "🇩🇪"),
            Country(code: "FR", name: "France", flagEmoji: "🇫🇷"),
          ],
        ),
      ),
    );
    await tester.pumpWidget(widget);
    expect(find.byType(ListTile), findsNWidgets(2));
  });
}
