import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/data/providers/country_details_provider.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/country_details_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandedCountryDetails extends ConsumerWidget {
  const ExpandedCountryDetails({required this.country, super.key});

  final Country country;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryDetailRequest = ref.watch(countryDetailsProvider(country));

    return countryDetailRequest.when(
        data: (countryDetails) {
          return CountryDetailsColumn(countryDetails: countryDetails);
        },
        error: (error, _) {
          return Text(error.toString());
        },
        loading: () => Center(
              child: CircularProgressIndicator(),
            ));
  }
}
