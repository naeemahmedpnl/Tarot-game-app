import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tarrot/common/widgets/custom_material_button.dart';

import '../../common/widgets/custom_seperate_widget.dart';
import '../../resources/constants/colors.dart';
import 'widgets/custom_card_tarot_type.dart';
import 'widgets/profile_container_widget.dart';
import 'widgets/t_search_profile_widget.dart';

class SearchProfileView extends StatefulWidget {
  const SearchProfileView({super.key});

  @override
  State<SearchProfileView> createState() => _SearchProfileViewState();
}

class _SearchProfileViewState extends State<SearchProfileView> {
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
          child: ListView(
            children: [
              // Sizedbox
              const SizedBox(height: 10),

              // Tarot Custom AppBar
              const TarotSearchProfileWidget(),

              // Sizedbox
              const SizedBox(height: 15),

              // Tarot Cards
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: TarotColors.textWhite),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileContainerWidget(
                              ratingValue: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Astro Vivek K",
                                  style: TextStyle(
                                    color: TarotColors.textWhite,
                                    fontFamily: 'Tarot-Serif',
                                    fontSize: 14,
                                  ),
                                ),
                                CustomCardTypeWidget(
                                  cardText: 'Consultant',
                                  icon: Iconsax.note,
                                ),
                                CustomCardTypeWidget(
                                  cardText: 'Native English',
                                  icon: Iconsax.language_square,
                                ),
                                CustomCardTypeWidget(
                                  cardText: '10 years',
                                  icon: Iconsax.calendar,
                                ),
                                CustomCardTypeWidget(
                                  cardText: '10\$',
                                  icon: Iconsax.dollar_circle,
                                )
                              ],
                            ),
                            Icon(
                              Iconsax.verify,
                              color: TarotColors.textWhite,
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomMaterialButton(
                              btnText: 'Chat',
                              onPressed: () {},
                            ),
                            CustomMaterialButton(
                              btnText: 'Call',
                              onPressed: () {},
                            ),
                            CustomMaterialButton(
                              btnText: 'Video Call',
                              onPressed: () {},
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: const CustomSeperator(color: Colors.grey),
                  );
                },
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
