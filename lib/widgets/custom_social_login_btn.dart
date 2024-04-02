import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/constants/colors.dart';

class CustomSocialLoginButton extends StatelessWidget {
  final String? btnText;
  final VoidCallback ontap;
  final Color btnTextColor;
  final bool loading;
  final Color btnColor;
  final double btnRadius;
  final double btnHeight;
  final double btnMargin;
  final double btnWidth;
  final Widget? child;
  const CustomSocialLoginButton({
    super.key,
    this.btnText,
    required this.ontap,
    this.btnRadius = 8,
    this.btnTextColor = Colors.white,
    this.btnColor = TarotColors.buttonColor,
    this.btnWidth = double.infinity,
    this.btnHeight = 60,
    this.btnMargin = 10,
    this.loading = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: btnWidth,
      height: btnHeight,
      margin: EdgeInsets.symmetric(horizontal: btnMargin),
      child: CupertinoButton(
        onPressed: ontap,
        child: loading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 16, 34, 43)
                      : Colors.white,
                ),
              )
            : child ??
                Text(
                  btnText!,
                  style: TextStyle(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 16, 34, 43)
                        : btnTextColor,
                    fontFamily: "Tarot-Alientz",
                    // fontSize: 18,
                  ),
                ),
      ),
    );
  }
}
