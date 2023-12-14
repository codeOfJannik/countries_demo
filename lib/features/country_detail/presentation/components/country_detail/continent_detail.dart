import 'package:countries_demo/common/models/continent.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/country_card.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_info/country_info_text.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContinentDetail extends StatelessWidget {
  const ContinentDetail({super.key, required this.continent});

  final Continent continent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
              alignment: Alignment.centerLeft,
              child: CountryInfoText(
                  title: S.of(context).continent, value: continent.name)),
        ),
        SizedBox(
          height: 150,
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: [
              SliverToBoxAdapter(child: SizedBox(width: 16)),
              SliverList.separated(
                  itemBuilder: (context, index) {
                    final country = continent.countries.elementAt(index);
                    return CountryCard(country: country);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 8);
                  },
                  itemCount: continent.countries.length),
              SliverToBoxAdapter(child: SizedBox(width: 16)),
            ],
          ),
        ),
      ],
    );
  }
}
