import 'package:countries_demo/common/models/country.dart';
import 'package:countries_demo/features/country_detail/presentation/components/country_detail/expanded_country_details.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpandableCountryDetails extends ConsumerStatefulWidget {
  const ExpandableCountryDetails({super.key, required this.country});

  final Country country;

  @override
  ConsumerState<ExpandableCountryDetails> createState() =>
      _ExpandableCountryDetailsState();
}

class _ExpandableCountryDetailsState
    extends ConsumerState<ExpandableCountryDetails> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return expanded
        ? ExpandedCountryDetails(country: widget.country)
        : OutlinedButton(
            onPressed: () => setState(() {
              expanded = true;
            }),
            child: Text(S.of(context).showMore),
          );
  }
}
