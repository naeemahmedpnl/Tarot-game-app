import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/models/user_model.dart';
import 'package:tarrot/resources/constants/sizes.dart';
import 'package:tarrot/resources/service/service_constants.dart';
import 'package:tarrot/utils/route/routes_name.dart';
import 'package:tarrot/view_model/auth_view_model.dart';
import 'package:tarrot/widgets/custom_btn.dart';
import 'package:tarrot/widgets/custom_textform_field.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/constants/image.dart';

class CreateProfileView extends StatefulWidget {
  final UserModel? user;
  const CreateProfileView({super.key, this.user});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> {
  late TextEditingController nameController;
  late TextEditingController genderController;
  late TextEditingController phoneController;
  late TextEditingController bodController;

  late String name;
  late String gender;
  late String phone;
  late String bod;

  @override
  void initState() {
    super.initState();
    if (widget.user != null) {
      nameController = TextEditingController(text: widget.user!.name);
      genderController = TextEditingController(text: widget.user!.gender);
      phoneController = TextEditingController(text: widget.user!.phone);
      bodController = TextEditingController(text: widget.user!.dob);
    }
    nameController = TextEditingController();
    genderController = TextEditingController();
    phoneController = TextEditingController();
    bodController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    bodController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // APP LOGO
                Image.asset(
                  loginImage,
                  height: TarotSizes.productItemHeight,
                ),

                const SizedBox(height: TarotSizes.buttonHeight),
              ],
            ),
            // Name
            CustomTextFormField(
              labelText: 'Name',
              prefixIcon: Iconsax.user,
              textEditingController: nameController,
              hintText: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: 10),

            // Birth Day
            CustomTextFormField(
              labelText: 'Birth Day',
              prefixIcon: Iconsax.calendar,
              keyboardType: TextInputType.datetime,
              textEditingController: bodController,
              hintText: 'Birth Day',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter birth day';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: 10),

            // Gender
            CustomTextFormField(
              labelText: 'Gender',
              prefixIcon: Iconsax.user_add,
              textEditingController: genderController,
              hintText: 'Gender',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your gender';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: 10),

            // Phone
            CustomTextFormField(
              labelText: 'Phone',
              prefixIcon: Iconsax.call,
              keyboardType: TextInputType.number,
              textEditingController: phoneController,
              hintText: 'Phone',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your Phone Number';
                }
                return null;
              },
            ),

            // Sizedbox
            const SizedBox(height: TarotSizes.buttonHeight * 2),

            // Custom Buttom
            Consumer<AuthViewModel>(
              builder: (context, value, child) {
                return CustomButton(
                  btnText: 'Continue',
                  btnRadius: 50,
                  btnHeight: 50,
                  ontap: () async {
                    if (_validateInputs()) {
                      name = nameController.text;
                      bod = bodController.text;
                      gender = genderController.text;
                      phone = phoneController.text;
                      final uid = auth.currentUser!.uid;
                      final email = auth.currentUser!.email;
                      debugPrint(uid + email.toString());
                      UserModel userModel = UserModel(
                        uid: uid,
                        email: email,
                        dob: bod,
                        gender: gender,
                        name: name,
                        phone: phone,
                      );
                      value.storeUserDataInDatabase(userModel).then(
                            (value) => Navigator.pushReplacementNamed(
                                context, RouteName.home),
                          );
                    }
                  },
                );
              },
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
      nameController,
      bodController,
      genderController,
      phoneController,
    ];

    for (TextEditingController controller in controllers) {
      if (controller.text.isEmpty) {
        isValid = false;
      }
    }

    return isValid;
  }
}
