import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:tarrot/resources/constants/colors.dart';
import 'package:tarrot/view_model/commom_view_model/selected_tab_view_model.dart';
import 'package:tarrot/views/home/home_view.dart';
import 'package:tarrot/views/profile/profile/profile_view.dart';
import 'package:tarrot/views/search_profiles/search_profiles_view.dart';

class BottomNavigationView extends StatelessWidget {
  const BottomNavigationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SelectedTabViewModel(),
      child: _BottomNavigationExample(),
    );
  }
}

class _BottomNavigationExample extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final selectedTabProvider = Provider.of<SelectedTabViewModel>(context);

    return Scaffold(
      key: _scaffoldKey,
      body: _pages[selectedTabProvider.selectedTab],
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: selectedTabProvider.selectedTab,
        showElevation: true,
        backgroundColor: TarotColors.containerColor,
        onItemSelected: (index) => selectedTabProvider.changeTab(index),
        items: [
          FlashyTabBarItem(
            icon: const Icon(Iconsax.home),
            title: const Text('Home'),
            activeColor: TarotColors.textWhite,
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.search_favorite),
            title: const Text('Search'),
            activeColor: TarotColors.textWhite,
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.save_add),
            title: const Text('Favourite'),
            activeColor: TarotColors.textWhite,
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.direct_inbox),
            title: const Text('Inbox'),
            activeColor: TarotColors.textWhite,
          ),
          FlashyTabBarItem(
            icon: const Icon(Iconsax.user),
            title: const Text('Profile'),
            activeColor: TarotColors.textWhite,
          ),
        ],
      ),
    );
  }

  final List<Widget> _pages = [
    const HomeView(),
    const SearchProfileView(),
    Container(),
    Container(),
    const ProfileView(),
  ];
}
