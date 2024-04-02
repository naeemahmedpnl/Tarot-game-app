import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/resources/constants/text_constants.dart';
import 'package:tarrot/views/profile/widget/user_profile_widget.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/constants/sizes.dart';
import '../../../resources/constants/style.dart';
import '../../../view_model/edit_profile_view_model.dart';
import '../../../widgets/custom_btn.dart';
import '../../../widgets/custom_textform_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: SafeArea(
            child: ListView(children: [
          // Sizedbox
          const SizedBox(height: TarotSizes.spaceBtwItems / 2),

          // My Profile Text
          const Align(
            child: Text(
              TarotText.myProfile,
              style: TarotStyle.textTarot,
            ),
          ),

          // Sizedbox
          const SizedBox(height: TarotSizes.spaceBtwItems / 2),

          Column(
            children: [
              // User Profile Widget
              const UserProfileWidget(),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 2),

              // All Text Form Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name Text Form Field
                      const Text("Name", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Name',
                            keyboardType: TextInputType.name,
                            textEditingController: value.nameController,
                            prefixIcon: Iconsax.user,
                            hintText: 'Name',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name Text Form Field
                      const Text("Phone", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Phone',
                            keyboardType: TextInputType.number,
                            textEditingController: value.phoneController,
                            prefixIcon: Iconsax.call,
                            hintText: 'Phone',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Phone Number';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name Text Form Field
                      const Text("Email", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            textEditingController: value.emailController,
                            prefixIcon: Iconsax.message,
                            hintText: 'Email',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Email';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name Text Form Field
                      const Text("Date of Birth", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Date of Birth TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Date of Birth',
                            keyboardType: TextInputType.datetime,
                            textEditingController: value.dobController,
                            prefixIcon: Iconsax.calendar,
                            hintText: 'Date of Birth',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your DOB';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Gender Widget
                      Consumer<EditProfileViewModel>(
                        builder: (context, genderViewModel, child) {
                          return Row(
                            children: [
                              const Text("Gender", style: TarotStyle.textTarot),
                              Radio(
                                value: 'male',
                                groupValue: genderViewModel.selectedGender,
                                activeColor: TarotColors.white,
                                onChanged: (value) {
                                  genderViewModel.setSelectedGender(value!);
                                },
                              ),
                              const Text('Male', style: TarotStyle.textTarot),
                              Radio(
                                value: 'female',
                                activeColor: TarotColors.white,
                                groupValue: genderViewModel.selectedGender,
                                onChanged: (value) {
                                  genderViewModel.setSelectedGender(value!);
                                },
                              ),
                              const Text('Female', style: TarotStyle.textTarot),
                            ],
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Location Text Form Field
                      const Text("Location", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Name TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Location',
                            textEditingController: value.locationController,
                            prefixIcon: Iconsax.location,
                            hintText: 'Location',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Location';
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Zip Code Text Form Field
                      const Text("Zip Code", style: TarotStyle.textTarot),
                      // Sizedbox
                      const SizedBox(height: TarotSizes.spaceBtwItems / 2),

                      // Zip Code TextFormField
                      Consumer<EditProfileViewModel>(
                        builder: (context, value, child) {
                          return CustomTextFormField(
                            labelText: 'Zip Code',
                            keyboardType: TextInputType.number,
                            textEditingController: value.zipCodeController,
                            prefixIcon: Iconsax.calendar,
                            hintText: 'Zip Code',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Zip Code';
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems * 2),

              // Save Button
              CustomButton(
                ontap: () {},
                btnRadius: 50,
                btnHeight: 45,
                btnText: "Save",
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 3),

              const Divider(
                color: TarotColors.darkGrey,
                thickness: 0.5,
                indent: 20,
                endIndent: 20,
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems / 3),

              // Discard Button
              CustomButton(
                ontap: () {},
                btnRadius: 50,
                btnHeight: 45,
                btnColor: TarotColors.textSecondary,
                btnText: "Discard",
              ),

              // Sizedbox
              const SizedBox(height: TarotSizes.spaceBtwItems * 2),
            ],
          ),
        ])),
      ),
    );
  }
}
