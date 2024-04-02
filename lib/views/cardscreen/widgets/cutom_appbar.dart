import 'package:flutter/material.dart';
import 'package:tarrot/common/widgets/app_logo_widget.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/resources/constants/text_constants.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    
        // ADD A BACK BUTTON
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
    
            // ADD A TITLE
        const Text(
          TarotText.tarrotCard,
          style: TextStyle(
            color: TarotColors.textWhite,
            fontFamily: 'Tarot-Serif',
            fontSize: 20,
          ),
        ),
    
        // ADD A LOGO
        const AppLogoWidget(logoSize: 45),
      ],
    );
  }
}
