import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/utils/utils.dart';
import 'package:tarrot/view_model/auth_view_model.dart';

import '../../../resources/constants/image.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/text_constants.dart';
import '../../../utils/route/routes_name.dart';
import '/widgets/custom_btn.dart';
import 'widgets/dont_have_account.dart';
import 'widgets/forget_button.dart';
import 'widgets/login_form_fields.dart';
import 'widgets/login_text_and_logo.dart';
import 'widgets/social_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    passwordController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    passwordController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              const LoginTextAndLogo(),

              const SizedBox(height: TarotSizes.buttonWidth / 3),

              //  EMAIL AND PASSWORD FIELDS
              LoginFormFields(
                emailController: emailController,
                passwordController: passwordController,
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.buttonHeight / 3),

              // Don't have an account
              const ForgetButton(),

              // Sizedbox
              const SizedBox(height: 10),

              // Custom Buttom
              Consumer<AuthViewModel>(
                builder: (context, value, child) {
                  return CustomButton(
                    btnText: TarotText.signInText,
                    btnRadius: 50,
                    btnHeight: 50,
                    loading: value.isloginbtn,
                    ontap: () {
                      if (_validateInputs()) {
                        email = emailController.text.trim.toString();
                        password = passwordController.text.trim.toString();

                        if (email.isEmpty || password.isEmpty) {
                          return Utils.flushBarErrorMessage(
                            'All fields are Required',
                            context,
                          );
                        }
                        value.signIn(
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          () {
                            Navigator.pushReplacementNamed(
                              context,
                              RouteName.checkIfUserExist,
                            ).then(
                              (value) => {
                                emailController.clear(),
                                passwordController.clear()
                              },
                            );
                          },
                        );
                      }
                    },
                  );
                },
              ),
              // Sizedbox
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<AuthViewModel>(
                    builder: (context, value, child) {
                      return SocialButton(
                        btnText: TarotText.googleText,
                        image: facebookImage,
                        ontap: () async {
                          await value.signInWithGoogle(
                            () => Navigator.pushReplacementNamed(
                              context,
                              RouteName.checkIfUserExist,
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              ),
              const SizedBox(height: TarotSizes.buttonHeight),

              const DontHaveAccountWidget(),

              const Spacer(),

              const Flexible(
                child: Divider(
                  color: TarotColors.grey,
                  thickness: 0.5,
                ),
              ),

              CupertinoButton(
                padding: const EdgeInsets.all(0),
                child: const Text(
                  "Login with Phone",
                  style: TextStyle(
                    color: TarotColors.textSecondary,
                    fontFamily: "Tarot-Serif",
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, RouteName.phoneView);
                },
              ),

              const SizedBox(height: 5)
            ],
          ),
        ),
      ),
    );
  }

  bool _validateInputs() {
    bool isValid = true;
    List<TextEditingController> controllers = [
      passwordController,
      emailController,
    ];

    for (TextEditingController controller in controllers) {
      if (controller.text.isEmpty) {
        isValid = false;
      }
    }

    return isValid;
  }
}
