import 'package:flutter/material.dart';

import '/common/widgets/app_logo_widget.dart';
import '/resources/constants/colors.dart';
import '/resources/constants/text_constants.dart';

class TarotSearchProfileWidget extends StatelessWidget {
  const TarotSearchProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          //Tarot App Logo
          const AppLogoWidget(logoSize: 45),

          SizedBox(width: MediaQuery.of(context).size.width / 3.5),

          // Tarot Welcome Text
          const Text(
            TarotText.profile,
            style: TextStyle(
              color: TarotColors.textWhite,
              fontFamily: 'Tarot-Serif',
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
