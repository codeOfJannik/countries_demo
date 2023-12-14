import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/presentation/country_detail_screen.dart';
import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  const CountryCard({super.key, required this.country});

  final Country country;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.of(context)
              .pushNamed(CountryDetailScreen.routeName, arguments: country);
        },
        child: SizedBox(
          width: 150,
          height: 150,
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Expanded(
                    child: Text(
                      country.flagEmoji,
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    country.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
