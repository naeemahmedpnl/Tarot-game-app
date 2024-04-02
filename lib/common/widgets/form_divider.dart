import 'package:flutter/material.dart';

import '../../resources/constants/colors.dart';
import '../../utils/helpers/helpers_functions.dart';

class FormDividerSection extends StatelessWidget {
  final String dividerText;
  const FormDividerSection({
    super.key,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    final dark = TarotHelperFunc.isDarkMode(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? TarotColors.darkGrey : TarotColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? TarotColors.darkGrey : TarotColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
