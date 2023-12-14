import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/presentation/country_detail_screen.dart';
import 'package:countries_demo/features/country_list/presentation/country_list_screen.dart';
import 'package:flutter/material.dart';

abstract final class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CountryListScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const CountryListScreen(),
          settings: settings,
        );
      case CountryDetailScreen.routeName:
        final country = settings.arguments as Country?;
        if (country == null) return null;

        return MaterialPageRoute(
          builder: (_) => CountryDetailScreen(country: country),
          settings: settings,
        );
    }
    return null;
  }
}
