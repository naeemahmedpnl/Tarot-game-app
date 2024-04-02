import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/utils/utils.dart';
import 'package:tarrot/view_model/auth_view_model.dart';
import 'package:tarrot/widgets/custom_btn.dart';
import 'package:tarrot/widgets/custom_textform_field.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/constants/image.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/text_constants.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmController;

  late String password;
  late String email;
  late String confirm;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmController = TextEditingController();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    confirmController.dispose();

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // APP LOGO
            Image.asset(
              createAccountImage,
              height: TarotSizes.productItemHeight,
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight),

            // WELCOME TEXT
            const Text(
              TarotText.registerMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TarotColors.textSecondary,
                fontSize: TarotSizes.fontSizeSm,
                fontFamily: "Tarot-Alientz",
              ),
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight),

            // Email
            CustomTextFormField(
              labelText: 'Email',
              prefixIcon: Iconsax.message,
              textEditingController: emailController,
              hintText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight),

            // Password
            CustomTextFormField(
              labelText: 'Password',
              prefixIcon: Iconsax.password_check,
              textEditingController: passwordController,
              hintText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Password';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight),

            // Confirm Password
            CustomTextFormField(
              labelText: 'Confirm Password',
              prefixIcon: Iconsax.password_check,
              textEditingController: confirmController,
              hintText: 'Confirm Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Confirm Password';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonWidth / 3),

            // Custom Buttom
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  btnText: 'Register',
                  btnRadius: 50,
                  btnHeight: 50,
                  ontap: () {
                    if (_validateInputs()) {
                      email = emailController.text;
                      password = passwordController.text;
                      confirm = confirmController.text;

                      if (passwordController.text != confirmController.text) {
                        Utils.flushBarErrorMessage(
                          "Password don't match",
                          context,
                        );
                        return;
                      }

                      value.createUserAccount(email, password).then(
                        (value) {
                          emailController.clear();
                          passwordController.clear();
                          confirmController.clear();
                        },
                      );
                    }
                  },
                );
              },
            ),

            // Already have an account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: TarotColors.textSecondary,
                    fontFamily: "Tarot-Var",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: TarotColors.borderSecondary,
                      fontFamily: "Tarot-Var",
                    ),
                  ),
                )
              ],
            ),

            // Sizedbox
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    bool isValid = true;
    List<TextEditingController> controllers = [
      emailController,
      passwordController,
      confirmController,
    ];

    for (TextEditingController controller in controllers) {
      if (controller.text.isEmpty) {
        isValid = false;
      }
    }

    return isValid;
  }
}
