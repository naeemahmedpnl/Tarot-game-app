import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int maxLength;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isVisible;
  final Widget? suffixIcon;
  final IconData? prefixIcon;

  final TextEditingController textEditingController;
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.textEditingController,
    required this.hintText,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardType,
    this.isVisible = false,
    this.maxLength = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        border: Border.all(color: TarotColors.textWhite),
      ),
      child: TextFormField(
        autocorrect: true,
        controller: textEditingController,
        maxLines: maxLength,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: isVisible,
        style: const TextStyle(color: TarotColors.textWhite),
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: Icon(prefixIcon),
          hintStyle: const TextStyle(
            color: TarotColors.textSecondary,
            fontFamily: "Tarot-Alientz",
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
