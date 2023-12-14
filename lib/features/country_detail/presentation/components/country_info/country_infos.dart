import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/data/providers/country_info_provider.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/expandable_country_details.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_info/country_infos_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryInfos extends ConsumerWidget {
  const CountryInfos({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryInfoRequest = ref.watch(countryInfoProvider(country));

    return countryInfoRequest.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text(error.toString())),
      data: (countryInfo) {
        return Column(
          children: [
            CountryInfosColumn(countryInfo: countryInfo),
            const SizedBox(height: 16),
            ExpandableCountryDetails(country: country),
          ],
        );
      },
    );
  }
}
