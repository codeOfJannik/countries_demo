import 'package:countries_demo/features/country_list/data/country_list_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final CountryListParser parser = CountryListParser();

  group("Test country list parser returns empty list", () {
    test("for empty json", () {
      final parsedData = parser.parse({});
      expect(parsedData, isEmpty);
    });

    test("for null json", () {
      final parsedData = parser.parse(null);
      expect(parsedData, isEmpty);
    });

    test("for json without countries key", () {
      final parsedData = parser.parse({"test": "test"});
      expect(parsedData, isEmpty);
    });

    test("for empty countries list", () {
      final parsedData = parser.parse({"countries": []});
      expect(parsedData, isEmpty);
    });

    test("for null countries list", () {
      final parsedData = parser.parse({"countries": null});
      expect(parsedData, isEmpty);
    });

    test("for countries list with invalid country json", () {
      final parsedData = parser.parse({
        "countries": [
          {
            "code": "DE",
            "name": "Germany",
            "flagEmoji": "🇩🇪",
          },
        ]
      });
      expect(parsedData, isEmpty);
    });
  });

  group("Test country list parser returns list of countries", () {
    test("for single country", () {
      final parsedData = parser.parse({
        "countries": [
          {
            "code": "DE",
            "name": "Germany",
            "emoji": "🇩🇪",
          }
        ]
      });
      expect(parsedData, isNotEmpty);
      expect(parsedData, hasLength(1));
      expect(parsedData.first.code, "DE");
      expect(parsedData.first.name, "Germany");
      expect(parsedData.first.flagEmoji, "🇩🇪");
    });

    test("for multiple countries", () {
      final parsedData = parser.parse({
        "countries": [
          {
            "code": "DE",
            "name": "Germany",
            "emoji": "🇩🇪",
          },
          {
            "code": "FR",
            "name": "France",
            "emoji": "🇫🇷",
          },
          {
            "code": "IT",
            "name": "Italy",
            "emoji": "🇮🇹",
          }
        ]
      });
      expect(parsedData, isNotEmpty);
      expect(parsedData, hasLength(3));
      expect(parsedData.first.code, "DE");
      expect(parsedData.first.name, "Germany");
      expect(parsedData.first.flagEmoji, "🇩🇪");
      expect(parsedData.elementAt(1).code, "FR");
      expect(parsedData.elementAt(1).name, "France");
      expect(parsedData.elementAt(1).flagEmoji, "🇫🇷");
      expect(parsedData.last.code, "IT");
      expect(parsedData.last.name, "Italy");
      expect(parsedData.last.flagEmoji, "🇮🇹");
    });

    test("for countries list with invalid country json", () {
      final parsedData = parser.parse({
        "countries": [
          {
            "code": "DE",
            "name": "Germany",
            "emoji": "🇩🇪",
          },
          {
            "code": "FR",
            "name": "France",
            "emoji": "🇫🇷",
          },
          {
            "code": "IT",
            "name": "Italy",
            "emoji": "🇮🇹",
          },
          {
            "code": "ES",
            "name": "Spain",
          }
        ]
      });
      expect(parsedData, isNotEmpty);
      expect(parsedData, hasLength(3));
      expect(parsedData.first.code, "DE");
      expect(parsedData.first.name, "Germany");
      expect(parsedData.first.flagEmoji, "🇩🇪");
      expect(parsedData.elementAt(1).code, "FR");
      expect(parsedData.elementAt(1).name, "France");
      expect(parsedData.elementAt(1).flagEmoji, "🇫🇷");
      expect(parsedData.last.code, "IT");
      expect(parsedData.last.name, "Italy");
      expect(parsedData.last.flagEmoji, "🇮🇹");
    });
  });
}
