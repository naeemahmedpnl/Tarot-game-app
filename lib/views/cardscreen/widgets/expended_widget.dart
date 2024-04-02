import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/views/cardscreen/widgets/card_girdview.dart';

class ExpendedWidget extends StatelessWidget {
  const ExpendedWidget({
    super.key,
    required this.cardData,
  });

  final CardData cardData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    
            // DISPLAY CARD IMAGE
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  cardData.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 20),
    
            // DISPLAY CARD DESCRIPTION
            Expanded(
              flex: 1,
              child: Text(
                cardData.description,
                style: const TextStyle(
                  color: TarotColors.textWhite,
                  fontFamily: 'Tarot-Serif',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

