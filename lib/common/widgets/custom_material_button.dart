import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onPressed;
  final String btnText;
  const CustomMaterialButton({
    super.key,
    required this.onPressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 28,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: TarotColors.textWhite,
      child: Text(
        btnText,
        style: const TextStyle(
          fontFamily: 'Tarot-Var',
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
