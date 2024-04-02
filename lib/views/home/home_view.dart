import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tarrot/common/widgets/app_logo_widget.dart';

import '../../../resources/constants/text_constants.dart';
import '../../resources/constants/colors.dart';
import '../../resources/constants/image.dart';
import 'widget/custom_profile_with_rating_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        gradient: TarotColors.tarotAppThemeColor,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sizedbox
            const SizedBox(height: 10),

            // Tarot Custom AppBar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Tarot App Logo
                  const AppLogoWidget(logoSize: 45),

                  // Tarot Welcome Text
                  const Text(
                    TarotText.welcomeForHome,
                    style: TextStyle(
                      color: TarotColors.textWhite,
                      fontFamily: 'Tarot-Serif',
                      fontSize: 20,
                    ),
                  ),

                  // Tarot User Profile Image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TarotColors.textWhite,
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: const EdgeInsets.all(3),
                    child: CircleAvatar(
                      radius: 19,
                      child: ClipOval(
                          child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(dummyUser),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            // Tarot Daily Text
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                TarotText.dailyTarot,
                style: TextStyle(
                  color: TarotColors.textWhite,
                  fontFamily: 'Tarot-Serif',
                  fontSize: 20,
                ),
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            // Tarot Home Slogan
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                TarotText.homeSlogan,
                style: TextStyle(
                  color: TarotColors.textWhite,
                  fontFamily: 'Tarot-Serif',
                  fontSize: 14,
                ),
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            // Tarot Service Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                TarotText.tarotServiceText,
                style: TextStyle(
                  color: TarotColors.textSecondary,
                  fontFamily: 'Tarot-Serif',
                  fontSize: 14,
                ),
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            // Tarot Features Call, Video, Message , Infor
            Container(
              height: 120,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: TarotColors.textWhite),
                borderRadius: BorderRadius.circular(12),
                color: TarotColors.containerColor,
              ),
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List<IconData> icons = [
                    Iconsax.call,
                    Iconsax.video,
                    Iconsax.message,
                    Iconsax.info_circle4,
                  ];
                  List<String> iconsText = [
                    "Call",
                    "Video",
                    "Message",
                    "Info",
                  ];
                  return CupertinoButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: TarotColors.textWhite),
                              borderRadius: BorderRadius.circular(12),
                              color: const Color(0xff483643),
                            ),
                            height: 75,
                            width: 75,
                            margin: const EdgeInsets.all(4),
                            child: Center(
                              child: Icon(
                                icons[index],
                                color: TarotColors.textWhite,
                                size: 30,
                              ),
                            ),
                          ),
                          Text(
                            iconsText[index],
                            style: const TextStyle(
                              color: TarotColors.textWhite,
                              fontFamily: 'Tarot-Serif',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            // Recommended Tarot Card Readers
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    TarotText.rTarotCardReaders,
                    style: TextStyle(
                      color: TarotColors.textWhite,
                      fontFamily: 'Tarot-Serif',
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        color: TarotColors.textWhite,
                        fontFamily: 'Tarot-Serif',
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationColor: TarotColors.textWhite,
                      ),
                    ),
                  )
                ],
              ),
            ),

            // Sizedbox
            const SizedBox(height: 8),

            Container(
              margin: const EdgeInsets.only(left: 10),
              height: 220,
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8);
                },
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  // Tarot Card Readers
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: TarotColors.textWhite,
                      ),
                      color: TarotColors.containerColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tarot Reader Profile
                        const ProfileWithRatingWidget(
                          profileIcon: Icons.person,
                          ratingValue: 5,
                        ),

                        // Sizedbox
                        const SizedBox(height: 5),

                        // Tarot Reader Text
                        const Text(
                          "Astro Vivek K",
                          style: TextStyle(
                            color: TarotColors.textWhite,
                            fontFamily: 'Tarot-Serif',
                            fontSize: 14,
                          ),
                        ),

                        // Sizedbox
                        const SizedBox(height: 5),

                        // Tarot Reader Price Text
                        const Text(
                          "0.5\$",
                          style: TextStyle(
                            color: TarotColors.textWhite,
                            fontFamily: 'Tarot-Serif',
                            fontSize: 14,
                          ),
                        ),

                        MaterialButton(
                          onPressed: () {},
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: TarotColors.textWhite,
                          child: const Text(
                            TarotText.tarotConnect,
                            style: TextStyle(
                              fontFamily: 'Tarot-Var',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
