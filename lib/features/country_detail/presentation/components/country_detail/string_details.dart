import 'package:flutter/material.dart';

class StringDetails extends StatelessWidget {
  const StringDetails(
      {super.key, required this.strings, required this.headline});

  final Iterable<String> strings;
  final String headline;

  @override
  Widget build(BuildContext context) {
    final bodyLargeStyle = Theme.of(context).textTheme.bodyLarge;
    if (strings.isEmpty) return SizedBox.shrink();

    return Column(
      children: [
        Text(
          headline,
          style: bodyLargeStyle?.copyWith(fontWeight: FontWeight.bold),
        ),
        GridView.builder(
          // For simplicity reasons shrinkWrap is used here. In a real app a
          // custom scroll view with slivers should be used instead.
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.sizeOf(context).width ~/ 150,
            childAspectRatio: 3,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16),
          itemCount: strings.length,
          itemBuilder: (context, index) {
            final state = strings.elementAt(index);
            return Center(
              child: Text(
                state,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            );
          },
        )
      ],
    );
  }
}
