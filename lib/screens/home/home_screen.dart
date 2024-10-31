// HomeScreen for the MoonVocs app.
// This screen serves as the main entry point after login, displaying banners, categories, popular products, and special offers.

import 'package:flutter/material.dart';
import 'components/quick_access_shortcuts.dart';
import 'components/user_progress_banner.dart';
import 'components/home_header.dart';
import 'components/orientation_resources.dart';
import 'components/inspiration_section.dart';

/// The HomeScreen widget is the main screen that users see after logging in.
///
/// It displays various sections such as a header, discount banners,
/// categories, popular products, and special offers, all within a scrollable view.
class HomeScreen extends StatelessWidget {
  /// Route name for navigating to the HomeScreen.
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              // Header widget with search and noétifications options.
              HomeHeader(),
              // A banner displaying current discounts and promotions.
              UserProgressBanner(),
              // A section for product categories.
              QuickAccessShortcuts(),
              // A section displaying popular products.
              OrientationResources(),
              SizedBox(height: 20),
              // A section with special offers for the users.
              InspirationSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
