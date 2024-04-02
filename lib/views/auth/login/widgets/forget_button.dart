import 'package:flutter/cupertino.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/text_constants.dart';
import '../../../../utils/route/routes_name.dart';

class ForgetButton extends StatelessWidget {
  const ForgetButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // const Icon(
        //   Iconsax.info_circle,
        //   color: TarotColors.textSecondary,
        // ),
        const SizedBox(width: 10),
        CupertinoButton(
          padding: const EdgeInsets.all(0),
          onPressed: () {
            Navigator.pushNamed(context, RouteName.resetPassword);
          },
          child: const Text(
            TarotText.forgetPassword,
            style: TextStyle(
              color: TarotColors.textSecondary,
              fontFamily: "Tarot-Alientz",
            ),
          ),
        )
      ],
    );
  }
}
