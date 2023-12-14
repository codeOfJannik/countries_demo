import 'package:countries_demo/features/country_list/country_list_constants.dart';
import 'package:countries_demo/features/country_list/data/country_list_provider.dart';
import 'package:countries_demo/features/country_list/presentation/components/country_list_view.dart';
import 'package:countries_demo/features/country_list/presentation/components/language_selection_popup_menu.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryListScreen extends ConsumerWidget {
  const CountryListScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryRequest = ref.watch(countryListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).countryListScreenAppBarTitle),
        actions: [LanguageSelectionPopupMenu()],
      ),
      body: countryRequest.when(
          data: (countries) => CountryListView(countries: countries),
          loading: () => const Center(
                child: CircularProgressIndicator(
                  key: CountryListConstants.loadingIndicatorKey,
                ),
              ),
          error: (error, _) => Center(
                child: Text(
                    key: CountryListConstants.errorTextKey, error.toString()),
              )),
    );
  }
}
