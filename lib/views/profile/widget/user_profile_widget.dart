import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tarrot/resources/constants/image.dart';
import 'package:tarrot/resources/constants/sizes.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/constants/style.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 15,
              ),
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                border: Border.all(
                  color: TarotColors.textWhite,
                ),
                color: TarotColors.containerColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: TarotSizes.spaceBtwItems * 2),
                  Text(
                    "Phone",
                    style: TarotStyle.textTarot,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Iconsax.mobile,
                        color: TarotColors.textWhite,
                      ),
                      SizedBox(width: TarotSizes.spaceBtwItems / 2),
                      Text(
                        "+923362159638",
                        style: TarotStyle.textTarot,
                      ),
                    ],
                  ),
                  SizedBox(height: TarotSizes.spaceBtwItems * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Personal Info",
                        style: TarotStyle.textTarot,
                      ),
                      Text(
                        "Settings",
                        style: TarotStyle.textTarot,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 135,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(
                  color: TarotColors.textWhite,
                  strokeAlign: CircularProgressIndicator.strokeAlignCenter,
                ),
                color: TarotColors.containerColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: CircleAvatar(
                radius: 45,
                child: ClipOval(
                    child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(dummyUser),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
