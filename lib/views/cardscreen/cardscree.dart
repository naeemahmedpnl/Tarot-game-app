// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:tarrot/common/widgets/app_logo_widget.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/resources/constants/text_constants.dart';

import 'widgets/card_girdview.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to the gradient color
      body: Container(
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: const SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),

                // Add a row to display the back button, title, and logo
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    Text(
                      TarotText.tarrotCard,
                      style: TextStyle(
                        color: TarotColors.textWhite,
                        fontFamily: 'Tarot-Serif',
                        fontSize: 20,
                      ),
                    ),
                    AppLogoWidget(logoSize: 45),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Add a column to display the title
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TarotText.tarrotCardChoose,
                      style: TextStyle(
                        color: TarotColors.textWhite,
                        fontFamily: 'Tarot-Serif',
                        fontSize: 20,
                      ),
                    ),

                    // Add a SizedBox to add space between message
                    SizedBox(height: 10),
                    Text(
                      TarotText.tarrotCardMessage,
                      style: TextStyle(
                        color: TarotColors.textWhite,
                        fontFamily: 'Tarot-Serif',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Add the CardGirdView widget
              CardGirdView(),
            ],
          ),
        ),
      ),
    );
  }
}

