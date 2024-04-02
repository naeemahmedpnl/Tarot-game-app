import 'package:flutter/material.dart';
import 'package:tarrot/resources/constants/image.dart';

class ProfileWithRatingWidget extends StatelessWidget {
  final IconData profileIcon;
  final double ratingValue;

  const ProfileWithRatingWidget({
    super.key,
    required this.profileIcon,
    required this.ratingValue,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Profile Icon
        // CircleAvatar(
        //   radius: 45,
        //   child: Icon(
        //     profileIcon,
        //     size: 90,
        //     color: Colors.blue,
        //   ),
        // ),

        CircleAvatar(
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

        // Rating Icon
        Positioned(
          bottom: 0,
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
