import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../widgets/custom_social_login_btn.dart';

class SocialButton extends StatelessWidget {
  final String image, btnText;
  final bool btnLoading;
  final void Function() ontap;
  const SocialButton({
    super.key,
    required this.image,
    required this.btnText,
    required this.ontap,
    this.btnLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: CustomSocialLoginButton(
        btnMargin: 0,
        btnRadius: 50,
        btnHeight: 80,
        ontap: ontap,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: TarotColors.textSecondary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              btnLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : Text(
                      btnText,
                      style: const TextStyle(
                        color: TarotColors.textWhite,
                        fontFamily: "Tarot-Alientz",
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
