import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/widgets/app_logo_widget.dart';
import '../../resources/constants/colors.dart';
import '../../resources/constants/image.dart';
import '../../resources/constants/sizes.dart';
import '../../resources/constants/text_constants.dart';
import '../../view_model/splash_screen_view_model.dart';
import 'widgets/splash_body_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final SplashScreenViewModel _viewModel = SplashScreenViewModel();

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
    _viewModel.splashScreenCounter(context);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SPACER
              const Spacer(),

              // APP LOGO
              Image.asset(
                tarotSplash,
                height: TarotSizes.productItemHeight,
              ),

              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwSections),

              // SPLASH BODY TEXT
              const WelcomeAndSloganText(),

              // SPACER
              const Spacer(),

              // CONTINUE TEXT
              const Text(
                TarotText.continueText,
                style: TextStyle(
                  color: TarotColors.textWhite,
                  fontSize: TarotSizes.fontSizeLg,
                  fontFamily: "Tarot-Serif",
                ),
              ),
              // SIZEDBOX
              const SizedBox(height: TarotSizes.spaceBtwSections),

              // APP LOGO
              const AppLogoWidget(logoSize: TarotSizes.appBarHeight),

              // SIZEDBOX
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
