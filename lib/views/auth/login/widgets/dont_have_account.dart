import 'package:flutter/cupertino.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/text_constants.dart';
import '../../../../utils/route/routes_name.dart';

class DontHaveAccountWidget extends StatelessWidget {
  const DontHaveAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          TarotText.dontHaveAccount,
          style: TextStyle(
            color: TarotColors.textSecondary,
            fontFamily: "Tarot-Alientz",
          ),
        ),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.register);
          },
          child: const Text(
            TarotText.registerText,
            style: TextStyle(
              color: TarotColors.textSecondary,
              fontFamily: "Tarot-Serif",
            ),
          ),
        ),
      ],
    );
  }
}
