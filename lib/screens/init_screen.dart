// init_screen.dart - Main screen with bottom navigation bar for navigating between app sections

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/personal/personal_screen.dart';
import 'package:shop_app/screens/calendar/calendar_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/search/search_screen.dart';
import 'package:shop_app/screens/fav/favorites_screen.dart'; // Import for FavoritesScreen
import 'package:shop_app/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  /// Updates the currently selected index in the bottom navigation bar.
  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  // List of pages that correspond to each tab in the bottom navigation bar.
  final pages = [
    const HomeScreen(), // Home screen
    const SearchScreen(initialTabIndex: 0), // Search screen with default tab
    const PersonalScreen(), // Placeholder for chat functionality
    const FavoritesScreen(), // Favorites screen
    const ProfileScreen(), // User profile screen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex], // Displays selected page content
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed, // Keeps icons in a fixed layout
        items: [
          // Home Tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Home",
          ),
          // Search Tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Search Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Search Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Search",
          ),
          // Personal (Chat) Tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/rocket.svg",
              width: 24.0,
              height: 24.0,
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/rocket.svg",
              width: 24.0,
              height: 24.0,
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Chat",
          ),
          // Favorites Tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Plus Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Plus Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Fav",
          ),
          // Profile Tab
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                inActiveIconColor,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              colorFilter: const ColorFilter.mode(
                kPrimaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
