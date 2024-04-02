import 'package:flutter/material.dart';

import '../../resources/constants/image.dart';

class AppLogoWidget extends StatelessWidget {
  final double logoSize;
  const AppLogoWidget({
    super.key,
    required this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      splashLogo,
      height: logoSize,
    );
  }
}
