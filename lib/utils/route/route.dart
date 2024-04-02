import 'package:flutter/material.dart';
import 'package:tarrot/models/user_model.dart';
import 'package:tarrot/views/auth/login/login_view.dart';
import 'package:tarrot/views/auth/otp_phone/otp_phone_view.dart';
import 'package:tarrot/views/auth/password_verified/password_verified_view.dart';
import 'package:tarrot/views/auth/phone/phone_view.dart';
import 'package:tarrot/views/auth/register/register_view.dart';
import 'package:tarrot/views/auth/send_reset_password/send_reset_password_view.dart';
import 'package:tarrot/views/cardscreen/cardscree.dart';
import 'package:tarrot/views/home/home_view.dart';
import 'package:tarrot/views/profile/create_profile/create_profile_view.dart';
import 'package:tarrot/views/profile/edit_profile/edit_profile_view.dart';
import 'package:tarrot/views/profile/profile/profile_view.dart';
import 'package:tarrot/views/verify/check_if_user_exist/check_if_user_exist_view.dart';

import '/views/splash/splash_view.dart';
import 'routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // SPLASH VIEW
      case RouteName.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());

      //TARROT READER ROUTE
      case RouteName.tarrotReader:
        return MaterialPageRoute(builder: (_) => const CardScreen());

      // LOGIN VIEW
      case RouteName.login:
        return MaterialPageRoute(builder: (_) => const LoginView());

      // REGISTER VIEW
      case RouteName.register:
        return MaterialPageRoute(builder: (_) => const RegisterView());

      // PHONE NUMBER AUTHENTICATION VIEW
      case RouteName.phoneView:
        return MaterialPageRoute(builder: (_) => const PhoneView());

      // PHONE NUMBER AUTHENTICATION VIEW
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomeView());

      // CHECK IF USER EXIST
      case RouteName.checkIfUserExist:
        return MaterialPageRoute(builder: (_) => const CheckIfUserExistView());

      // Profile View
      case RouteName.profile:
        return MaterialPageRoute(builder: (_) => const ProfileView());

      //Edit Profile View
      case RouteName.editProfile:
        return MaterialPageRoute(builder: (_) => const EditProfileView());

      // CREATE PROFILE FOR USER
      case RouteName.createProfile:
        return MaterialPageRoute(
          builder: (_) => CreateProfileView(
            user: UserModel.initialUser,
          ),
        );

      // RESET PASSWORD VIEW
      case RouteName.resetPassword:
        return MaterialPageRoute(
          builder: (_) => const SendResetPasswordView(),
        );

      // RESET PASSWORD VERFIED VIEW
      case RouteName.passwordVerified:
        return MaterialPageRoute(
          builder: (_) => const PasswordVerifiedView(),
        );

      // OTP VERIFY VIEW
      case RouteName.otpPhoneView:
        // Extract arguments passed to the route
        final Map<String, dynamic>? args =
            settings.arguments as Map<String, dynamic>?;

        // Access phoneNumber and verificationId from the arguments map
        final String phoneNumber = args?['phoneNumber'] ?? "";
        final String verificationId = args?['verificationId'] ?? "";

        // Pass phoneNumber and verificationId to OtpPhoneView
        return MaterialPageRoute(
          builder: (_) => OtpPhoneView(
            phoneNumber: phoneNumber,
            verificationId: verificationId,
          ),
        );

      default:
        // DEFAULT MESSAGE
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No Route Found'),
              ),
            );
          },
        );
    }
  }
}
