import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/resources/constants/style.dart';

class CustomCardTypeWidget extends StatelessWidget {
  final IconData icon;
  final String cardText;
  const CustomCardTypeWidget({
    super.key,
    required this.icon,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: TarotColors.textSecondary,
          ),
          const SizedBox(width: 2),
          Text(cardText, style: TarotStyle.textTarot),
        ],
      ),
    );
  }
}
