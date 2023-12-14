import 'package:countries_demo/common/data/providers.dart';
import 'package:countries_demo/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageSelectionPopupMenu extends ConsumerWidget {
  const LanguageSelectionPopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(selectedLocaleProvider);

    return PopupMenuButton(
        onSelected: (value) =>
            ref.read(selectedLocaleProvider.notifier).state = value,
        itemBuilder: (context) => S.delegate.supportedLocales
            .map((locale) => PopupMenuItem(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(locale.languageCode.toUpperCase()),
                      Spacer(),
                      if (selectedLanguage == locale)
                        Icon(Icons.check, color: Colors.orange),
                    ],
                  ),
                  value: locale,
                ))
            .toList());
  }
}
