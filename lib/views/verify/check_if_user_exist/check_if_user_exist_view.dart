import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/views/bottom_navigation/bottom_navigation_view.dart';
import 'package:tarrot/views/profile/create_profile/create_profile_view.dart';

import '../../../resources/constants/colors.dart';
import '../../../view_model/user_existing_view_model.dart';

class CheckIfUserExistView extends StatelessWidget {
  const CheckIfUserExistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: TarotColors.tarotAppThemeColor,
        ),
        child: FutureBuilder<bool>(
          future:
              Provider.of<UserExistenceProvider>(context).checkUserExistence(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: TarotColors.textWhite,
                ),
              );
            } else {
              if (snapshot.hasData) {
                if (snapshot.data!) {
                  return const BottomNavigationView();
                } else {
                  return const CreateProfileView();
                }
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return const Text('Unknown Error');
              }
            }
          },
        ),
      ),
    );
  }
}
