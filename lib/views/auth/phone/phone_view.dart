import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/view_model/auth_view_model.dart';
import 'package:tarrot/widgets/custom_btn.dart';

import '../../../common/auth_widgets/country_code_picker.dart' as ccp;
import '../../../common/auth_widgets/country_code_picker.dart';
import '../../../resources/constants/colors.dart';
import '../../../resources/constants/image.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/text_constants.dart';
import '../../../utils/utils.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    phoneController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // APP LOGO
            Image.asset(
              loginImage,
              height: TarotSizes.productItemHeight,
            ),

            const SizedBox(height: TarotSizes.buttonHeight * 2),

            // WELCOME TEXT
            const Text(
              TarotText.phoneViewMessage,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: TarotColors.textSecondary,
                fontSize: TarotSizes.fontSizeMd,
                fontFamily: "Tarot-Alientz",
              ),
            ),

            const SizedBox(height: TarotSizes.buttonHeight * 2),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                border: Border.all(color: TarotColors.textWhite),
              ),
              child: Row(
                children: [
                  const CountryCodePicker(),
                  // Phone
                  Flexible(
                    child: TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: TarotColors.textWhite),
                      decoration: const InputDecoration(
                        hintText: 'Phone',
                        hintStyle: TextStyle(
                          color: TarotColors.textSecondary,
                          fontFamily: "Tarot-Alientz",
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight * 2),

            // Custom Buttom
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  btnText: 'Continue',
                  btnRadius: 50,
                  loading: value.phoneAuthenticationLoading,
                  btnHeight: 50,
                  ontap: () {
                    if (phoneController.text.isNotEmpty) {
                      String phoneNumber = phoneController.text.toString();
                      String countryCode = ccp.phonecode;
                      if (phoneNumber.isEmpty || phoneNumber == "") {
                        Utils.flushBarErrorMessage(
                            'Please enter phone number', context);
                      } else if (countryCode.isEmpty || countryCode == "") {
                        Utils.flushBarErrorMessage(
                            'Please Select Country Code', context);
                      } else if (phoneNumber.startsWith('0')) {
                        Utils.flushBarErrorMessage(
                            'Please remove zero from start', context);
                      } else if (phoneNumber.length != 10) {
                        Utils.flushBarErrorMessage(
                            'Please enter Correct number', context);
                      } else {
                        debugPrint('+$countryCode$phoneNumber');
                        value.signUpWithPhoneNumberAndOTP(
                            '+$countryCode$phoneNumber', context);
                      }
                      // String phone = phoneController.text;
                      // Navigator.pushNamed(
                      //   context,
                      //   RouteName.otpPhoneView,
                      //   arguments: {
                      //     'phoneNumber': "+1234567890",
                      //     'verificationId': "your_verification_id_here",
                      //   },
                      // );
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
