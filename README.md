# countries_demo

A demo project using graphql and riverpod.

## Getting Started

Get dependencies by running `flutter pub get` in the project directory.

Generate files by starting the build_runner with `flutter pub run build_runner watch --delete-conflicting-outputs` in the project directory.

Run the app with `flutter run` in the project directory.

## Features

A list of countries fetched from https://countries.trevorblades.com is displayed.

The user can select a country to see a country detail page. On the detail page the user can click on a "See more" button to see more details about the country. The expanded details show also information about the continent the country is in and the other countries in the continent are listed. If the user clicks on a country in the list of countries in the continent, the detail page of the selected country is shown.

## Tests

The tests are located in the `test` directory. It just shows the basic concept how testing would be set up. The tests are not complete.

The tests of `widget_tests/country_list_screen_test.dart` are not working since the current mock setup of the riverpod provider's `AsyncValue` is not working properly.

Run tests with `flutter test` in the project directory.