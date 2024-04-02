import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tarrot/data/network_service.dart';
import 'package:tarrot/resources/constants/image.dart';
import 'package:tarrot/resources/constants/text_constants.dart';
import 'package:tarrot/utils/route/routes_name.dart';
import 'package:tarrot/views/profile/profile/widgets/custom_expansion_tile.dart';
import 'package:tarrot/views/profile/widget/user_profile_widget.dart';

import '../../../common/widgets/app_logo_widget.dart';
import '../../../resources/constants/colors.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/style.dart';
import '../../../widgets/custom_btn.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
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
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              // My Profile Text

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Tarot App Logo
                    const AppLogoWidget(logoSize: 45),

                    // Profile Text
                    const Text(
                      TarotText.myProfile,
                      style: TarotStyle.textTarot,
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteName.editProfile);
                      },
                      icon: const Icon(
                        Iconsax.edit,
                        color: TarotColors.white,
                      ),
                    )
                  ],
                ),
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              // User Profile Widget
              const UserProfileWidget(),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              // FAQ's & Policies
              CustomExpansionTile(
                title: TarotText.policieConstrants[0].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              // FAQ's & Policies
              CustomExpansionTile(
                title: TarotText.policieConstrants[1].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),
              CustomExpansionTile(
                title: TarotText.policieConstrants[2].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),
              CustomExpansionTile(
                title: TarotText.policieConstrants[3].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              CustomExpansionTile(
                title: TarotText.policieConstrants[4].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),
              CustomExpansionTile(
                title: TarotText.policieConstrants[5].toString(),
                content: TarotText.feedbackSupportData.toString(),
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwItems * 2),

              // LOGOUT BUTTON
              CustomButton(
                ontap: () async {
                  await Future.wait([
                    NetworkService().signOut(),
                    NetworkService().handleSignOut(),
                  ]);
                  Navigator.pushReplacementNamed(context, RouteName.login);
                },
                btnRadius: 50,
                btnHeight: 45,
                btnText: "Logout",
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwItems * 2),

              // FOLLOW US TEXT
              const Align(
                alignment: Alignment.center,
                child: Text(
                  "Follow us on",
                  style: TarotStyle.textTarot,
                ),
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwItems / 3),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SOCIAL BUTTON
                  CupertinoButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              socialImages[0],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // SIZEDBOX
                  const SizedBox(width: 4),

                  // SOCIAL BUTTON
                  CupertinoButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              socialImages[1],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // SIZEDBOX
                  const SizedBox(width: 4),

                  // SOCIAL BUTTON
                  CupertinoButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              socialImages[2],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // SIZEBOX
                  const SizedBox(width: 4),

                  // SOCIAL BUTTON
                  CupertinoButton(
                    onPressed: () {},
                    padding: const EdgeInsets.all(4),
                    child: CircleAvatar(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              socialImages[3],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // SIZEBOX
              const SizedBox(height: TarotSizes.spaceBtwItems * 2),
              Text(
                "App version 1.0",
                textAlign: TextAlign.center,
                style: TarotStyle.textTarot.copyWith(
                  color: TarotColors.textSecondary,
                ),
              ),

              // SIZEBOX
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),
            ],
          ),
        ),
      ),
    );
  }
}
