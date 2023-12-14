import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/presentation/country_detail_screen.dart';
import 'package:flutter/material.dart';

class CountryListView extends StatelessWidget {
  const CountryListView({super.key, required this.countries});

  final List<Country> countries;

  @override
  Widget build(BuildContext context) => ListView.separated(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          final country = countries[index];

          return ListTile(
            title: Text(country.name),
            leading: Text(country.flagEmoji, style: TextStyle(fontSize: 24)),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context)
                .pushNamed(CountryDetailScreen.routeName, arguments: country),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      );
}
