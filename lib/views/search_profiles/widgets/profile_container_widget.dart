import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/image.dart';

import '../../../resources/constants/colors.dart';

class ProfileContainerWidget extends StatelessWidget {
  final double ratingValue;

  const ProfileContainerWidget({
    super.key,
    required this.ratingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: TarotColors.textWhite,
              ),
              color: TarotColors.containerColor,
              borderRadius: BorderRadius.circular(15),
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

        // Rating Icon
        Positioned(
          bottom: 5,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 15,
                ),
                Text(
                  ratingValue.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
