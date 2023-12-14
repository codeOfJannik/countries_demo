import 'package:countries_demo/common/app_router.dart';
import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/features/country_list/presentation/country_list_screen.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const CountryDemoApp()));
}

class CountryDemoApp extends ConsumerWidget {
  const CountryDemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLocale = ref.watch(selectedLocaleProvider);

    return MaterialApp(
      locale: selectedLocale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: CountryListScreen.routeName,
    );
  }
}
