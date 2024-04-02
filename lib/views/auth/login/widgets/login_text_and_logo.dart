import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/image.dart';
import '../../../../resources/constants/sizes.dart';
import '../../../../resources/constants/text_constants.dart';

class LoginTextAndLogo extends StatelessWidget {
  const LoginTextAndLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // APP LOGO
        Image.asset(
          loginImage,
          height: TarotSizes.productItemHeight,
        ),

        const SizedBox(height: TarotSizes.buttonHeight),

        // WELCOME TEXT
        const Text(
          TarotText.signInText,
          style: TextStyle(
            color: TarotColors.textWhite,
            fontSize: TarotSizes.fontSizeLg,
            fontFamily: "Tarot-Alientz",
          ),
        ),
      ],
    );
  }
}
