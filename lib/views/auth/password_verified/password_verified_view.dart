import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/widgets/custom_btn.dart';

import '../../../common/widgets/app_logo_widget.dart';
import '../../../resources/constants/image.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/text_constants.dart';
import '../../../utils/route/routes_name.dart';

class PasswordVerifiedView extends StatefulWidget {
  const PasswordVerifiedView({super.key});

  @override
  State<PasswordVerifiedView> createState() => _PasswordVerifiedViewState();
}

class _PasswordVerifiedViewState extends State<PasswordVerifiedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: TarotColors.tarotAppThemeColor),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            // APP LOGO
            Image.asset(
              passwordVerifiedImage,
              height: TarotSizes.productItemHeight,
            ),

            const SizedBox(height: TarotSizes.buttonHeight * 4),

            const AppLogoWidget(
              logoSize: TarotSizes.productImageSize / 2,
            ),

            const SizedBox(height: TarotSizes.buttonHeight),

            // FORGET PASSWORD TEXT
            const Text(
              TarotText.resetPasswordRecevedMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TarotColors.textWhite,
                fontSize: TarotSizes.fontSizeSm,
                fontFamily: "Tarot-Alientz",
              ),
            ),

            const SizedBox(height: TarotSizes.buttonHeight * 2),

            // BUTTON
            CustomButton(
              btnRadius: 50,
              btnHeight: 50,
              btnText: "Continue",
              ontap: () {
                Navigator.pushReplacementNamed(context, RouteName.login);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
