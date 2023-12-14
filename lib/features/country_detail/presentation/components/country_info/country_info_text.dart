import 'package:flutter/material.dart';

class CountryInfoText extends StatelessWidget {
  const CountryInfoText({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(color: Colors.black),
        children: [
          TextSpan(
              text: '$title: ',
              style: textStyle?.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(text: value, style: textStyle),
        ],
      ),
    );
  }
}
