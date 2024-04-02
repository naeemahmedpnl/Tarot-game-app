import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tarrot/utils/route/routes_name.dart';

import '../resources/service/service_constants.dart';

class SplashScreenViewModel extends ChangeNotifier {
  Timer? timer;

  void splashScreenCounter(BuildContext context) {
    if (user != null) {
      timer = Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RouteName.checkIfUserExist);
      });
    } else {
      timer = Timer(const Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, RouteName.login);
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
