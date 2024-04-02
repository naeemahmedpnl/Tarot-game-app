import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/view_model/commom_view_model/password_visibility_view_mode.dart';

import '../../../../resources/constants/sizes.dart';
import '../../../../widgets/custom_textform_field.dart';

class LoginFormFields extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginFormFields(
      {super.key,
      required this.emailController,
      required this.passwordController});

  @override
  State<LoginFormFields> createState() => _LoginFormFieldsState();
}

class _LoginFormFieldsState extends State<LoginFormFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email
        CustomTextFormField(
          labelText: 'email@gmail.com',
          keyboardType: TextInputType.emailAddress,
          textEditingController: widget.emailController,
          prefixIcon: Icons.mail_outline_outlined,
          hintText: 'email@gmail.com',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Phone Number';
            }
            return null;
          },
        ),

        // Sizedbox
        const SizedBox(height: TarotSizes.buttonHeight),

        // Password
        Consumer<PasswordVisibilityViewModel>(
          builder: (context, value, child) {
            return CustomTextFormField(
              labelText: 'Password',
              textEditingController: widget.passwordController,
              hintText: 'Password',
              isVisible: value.isPasswordVisible,
              prefixIcon: Icons.lock,
              suffixIcon: GestureDetector(
                onTap: () {
                  value.togglePasswordVisibility();
                },
                child: Icon(
                  value.isPasswordVisible
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Password';
                }
                return null;
              },
            );
          },
        )
      ],
    );
  }
}
