import 'package:flutter/material.dart';
import 'package:tarrot/widgets/custom_btn.dart';
import 'package:tarrot/widgets/custom_textform_field.dart';

class OtpPhoneView extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const OtpPhoneView({
    super.key,
    required this.verificationId,
    required this.phoneNumber,
  });

  @override
  State<OtpPhoneView> createState() => _OtpPhoneViewState();
}

class _OtpPhoneViewState extends State<OtpPhoneView> {
  late TextEditingController otpController;

  @override
  void initState() {
    super.initState();
    otpController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    otpController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Phone
          CustomTextFormField(
            labelText: 'OTP',
            keyboardType: TextInputType.number,
            textEditingController: otpController,
            hintText: 'OTP',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your OTP';
              }
              return null;
            },
          ),

          // Sizedbox
          const SizedBox(height: 10),

          // Custom Buttom
          CustomButton(
            btnText: 'Send OTP',
            ontap: () {
              if (otpController.text.isNotEmpty) {}
            },
          ),
        ],
      ),
    );
  }
}
