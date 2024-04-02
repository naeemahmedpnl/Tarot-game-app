import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/utils/route/routes_name.dart';
import 'package:tarrot/utils/utils.dart';
import 'package:tarrot/view_model/auth_view_model.dart';
import 'package:tarrot/widgets/custom_btn.dart';

import '../../../resources/constants/sizes.dart';
import '../../../widgets/custom_textform_field.dart';
import 'widgets/fp_logo_and_text.dart';

class SendResetPasswordView extends StatefulWidget {
  const SendResetPasswordView({super.key});

  @override
  State<SendResetPasswordView> createState() => _SendResetPasswordViewState();
}

class _SendResetPasswordViewState extends State<SendResetPasswordView> {
  late TextEditingController emailController;
  late String email;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: TarotColors.tarotAppThemeColor),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FORGET PASSWORD LOGO & TEXT
            const ForgetPasswordLogoTextWidget(),

            // SIZEDBOX
            const SizedBox(height: TarotSizes.spaceBtwInputFields * 5),

            // EMAIL
            CustomTextFormField(
              labelText: 'email@email.com',
              textEditingController: emailController,
              prefixIcon: Icons.mail_outline,
              hintText: 'Enter your email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
                return null;
              },
            ),

            // SIZEDBOX
            const SizedBox(height: TarotSizes.buttonHeight),

            // SIZEDBOX
            const SizedBox(height: 10),

            // CUSTOM BUTTON
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  btnText: 'Continue',
                  btnMargin: 0,
                  btnRadius: 50,
                  loading: value.forgotPasswordLoading,
                  ontap: () {
                    if (emailController.text.isNotEmpty) {
                      email = emailController.text;
                      value.sendResetLink(email).then(
                            (value) => Navigator.pushReplacementNamed(
                              context,
                              RouteName.passwordVerified,
                            ),
                          );
                    } else {
                      Utils.flushBarErrorMessage("Enter your email", context);
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
