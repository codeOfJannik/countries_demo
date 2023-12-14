import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_info/country_infos.dart';
import 'package:flutter/material.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({super.key, required this.country});
  static const routeName = '/country_detail';

  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Center(
            child: Text(country.flagEmoji, style: TextStyle(fontSize: 64)),
          ),
          const SizedBox(height: 16),
          CountryInfos(country: country),
        ]),
      ),
    );
  }
}
