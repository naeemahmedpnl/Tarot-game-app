import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/image.dart';
import '../../../../resources/constants/sizes.dart';
import '../../../../resources/constants/text_constants.dart';

class ForgetPasswordLogoTextWidget extends StatelessWidget {
  const ForgetPasswordLogoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // APP LOGO
        Image.asset(
          forgetPasswordImage,
          height: TarotSizes.productItemHeight,
        ),

        const SizedBox(height: TarotSizes.buttonHeight),

        // FORGET PASSWORD TEXT
        const Text(
          TarotText.resetPassword,
          style: TextStyle(
            color: TarotColors.textWhite,
            fontSize: TarotSizes.fontSizeLg,
            fontFamily: "Tarot-Alientz",
          ),
        ),

        const SizedBox(height: TarotSizes.buttonHeight),

        // WELCOME TEXT
        const Text(
          TarotText.resetPasswordMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: TarotColors.textSecondary,
            fontSize: TarotSizes.fontSizeSm,
            fontFamily: "Tarot-Alientz",
          ),
        ),
      ],
    );
  }
}
