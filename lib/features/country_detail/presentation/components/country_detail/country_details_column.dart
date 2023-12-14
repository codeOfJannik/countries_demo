import 'package:countries_demo/features/country_detail/model/country_details.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/continent_detail.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/country_detail_card.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/language_details.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/string_details.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class CountryDetailsColumn extends StatelessWidget {
  const CountryDetailsColumn({super.key, required this.countryDetails});

  final CountryDetails countryDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContinentDetail(continent: countryDetails.continent),
        SizedBox(height: 16),
        CountryDetailCard(
          hideCard: countryDetails.languages.isEmpty,
          child: LanguageDetails(languages: countryDetails.languages),
        ),
        CountryDetailCard(
          hideCard: countryDetails.states.isEmpty,
          child: StringDetails(
              strings: countryDetails.states,
              // Localizely generates strings for plurals not correctly.
              // So checking for length is a workaround.
              headline: countryDetails.states.length == 1
                  ? S.of(context).state
                  : S.of(context).states),
        ),
        CountryDetailCard(
          hideCard: countryDetails.phoneCodes.isEmpty,
          child: StringDetails(
              strings:
                  countryDetails.phoneCodes.map((phoneCode) => "+$phoneCode"),
              // Localizely generates strings for plurals not correctly.
              // So checking for length is a workaround.
              headline: countryDetails.phoneCodes.length == 1
                  ? S.of(context).phoneCode
                  : S.of(context).phoneCodes),
        ),
        SizedBox(height: 16)
      ],
    );
  }
}
