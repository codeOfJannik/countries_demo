import 'package:countries_demo/features/country_detail/model/country_info.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_info/country_info_text.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class CountryInfosColumn extends StatelessWidget {
  const CountryInfosColumn({super.key, required this.countryInfo});

  final CountryInfo countryInfo;

  @override
  Widget build(BuildContext context) {
    final capital = countryInfo.capital;
    final currency = countryInfo.currency;

    return Column(
      children: [
        CountryInfoText(
            title: S.of(context).nativeName, value: countryInfo.nativeName),
        if (capital != null)
          CountryInfoText(title: S.of(context).capital, value: capital),
        if (currency != null)
          CountryInfoText(title: S.of(context).currency, value: currency),
      ],
    );
  }
}
