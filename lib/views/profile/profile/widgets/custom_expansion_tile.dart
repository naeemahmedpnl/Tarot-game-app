import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/resources/constants/style.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final String content;
  final bool useDivider;

  const CustomExpansionTile({
    super.key,
    required this.title,
    required this.content,
    this.useDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            title,
            style: TarotStyle.textTarot,
          ),
          iconColor: TarotColors.white,
          collapsedIconColor: TarotColors.white,
          expandedAlignment: Alignment.topLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Adjust as needed
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                content,
                style: TarotStyle.textTarot,
              ),
            ),
          ],
        ),
        if (useDivider)
          const Divider(
            color: TarotColors.grey,
            indent: 10,
            endIndent: 10,
          ),
        if (!useDivider) Text('-' * 40), // Use a text separator
      ],
    );
  }
}
