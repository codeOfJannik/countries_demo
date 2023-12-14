import 'package:countries_demo/common/models/language.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';

class LanguageDetails extends StatelessWidget {
  const LanguageDetails({super.key, required this.languages});

  final Iterable<Language> languages;

  @override
  Widget build(BuildContext context) {
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;
    if (languages.isEmpty) return SizedBox.shrink();

    return Column(
      children: [
        Text(
          // Localizely generates strings for plurals not correctly.
          // So checking for length is a workaround.
          languages.length == 1
              ? S.of(context).language
              : S.of(context).languages,
          style: bodyLargeStyle?.copyWith(fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          // For simplicity reasons shrinkWrap is used here. In a real app a
          // custom scroll view with slivers should be used instead.
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.sizeOf(context).width ~/ 150,
              childAspectRatio: 2),
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: languages.length,
          itemBuilder: (context, index) {
            final language = languages.elementAt(index);
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(language.name, style: bodyLargeStyle),
                Text(
                  language.nativeName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
