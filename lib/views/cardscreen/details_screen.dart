import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/views/cardscreen/popup_card.dart';
import 'package:tarrot/views/cardscreen/widgets/cutom_appbar.dart';
import 'package:tarrot/views/cardscreen/widgets/expended_widget.dart';
import 'package:tarrot/widgets/custom_btn.dart';

import 'widgets/card_girdview.dart';

class DetailScreen extends StatelessWidget {
  final CardData cardData;

  const DetailScreen({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set the background color to the gradient color
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ADD A ROW TO DISPLAY THE BACK BUTTON, TITLE, AND LOGO
                const CustomAppBar(),
                const SizedBox(height: 10),

                // ADD A PADDING TO DISPLAY THE TITLE
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    cardData.name,
                    style: const TextStyle(
                      color: TarotColors.textWhite,
                      fontFamily: 'Tarot-Serif',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ADD A EXPENDED TO DISPLAY THE DESCRIPTION & IMAGE
                ExpendedWidget(cardData: cardData),
                const SizedBox(height: 20),

                // ADD A BUTTON TO SHOW THE POPUP
                Padding(
                  padding: const EdgeInsets.only(bottom: 120),
                  child: CustomButton(ontap: (){
                    showDialog(
                      context: context,
                      builder: (context) {
                        return PopupCard(
                          cardData: cardData,
                        );
                      },
                    );
                  },
                  btnText:  'Show Popup',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

