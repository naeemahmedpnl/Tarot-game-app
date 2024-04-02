import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/text_constants.dart';

class WelcomeAndSloganText extends StatelessWidget {
  const WelcomeAndSloganText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // WELCOME TEXT
        Text(
          TarotText.welcomeText,
          style: TextStyle(
            color: TarotColors.textWhite,
            fontSize: TarotSizes.fontSizeVeryLg,
            fontFamily: "Tarot-Alientz",
          ),
        ),

        // APP SLOGAN TEXT
        Text(
          TarotText.welcomeSlogan,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TarotColors.textWhite,
            fontSize: TarotSizes.fontSizeMd,
            fontFamily: "Tarot-Alientz",
          ),
        ),
      ],
    );
  }
}
