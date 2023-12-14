import 'package:flutter/material.dart';

class CountryDetailCard extends StatelessWidget {
  const CountryDetailCard(
      {super.key, required this.child, required this.hideCard});

  final Widget child;
  final bool hideCard;

  @override
  Widget build(BuildContext context) {
    return hideCard
        ? SizedBox.shrink()
        : Card(
            elevation: 2,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Padding(padding: const EdgeInsets.all(16), child: child),
          );
  }
}
