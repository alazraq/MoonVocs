// QuickAccessShortcuts widget for the MoonVocs app.
// This widget displays shortcut cards to quickly access sections like "Métiers," "Formations," "Bourses," and "Bureaucratie."

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/search/search_screen.dart';

/// The QuickAccessShortcuts widget provides direct access to key app sections.
///
/// Each shortcut is represented by an icon and text, and redirects to a
/// specified tab within the FavoriteScreen.
class QuickAccessShortcuts extends StatelessWidget {
  const QuickAccessShortcuts({super.key});

  @override
  Widget build(BuildContext context) {
    // List of shortcuts with icon, text label, and target tab index.
    List<Map<String, dynamic>> shortcuts = [
      {"icon": "assets/icons/Discover.svg", "text": "Métiers", "tabIndex": 0},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Ecoles", "tabIndex": 1},
      {"icon": "assets/icons/Shop Icon.svg", "text": "Formations", "tabIndex": 2},
      {"icon": "assets/icons/Cash.svg", "text": "Bourses", "tabIndex": 3},

    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          shortcuts.length,
              (index) => ShortcutCard(
            icon: shortcuts[index]["icon"],
            text: shortcuts[index]["text"],
            tabIndex: shortcuts[index]["tabIndex"],
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    initialTabIndex: shortcuts[index]["tabIndex"],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// The ShortcutCard widget displays an icon and label for each quick access shortcut.
///
/// When tapped, it navigates to the specified tab in the FavoriteScreen.
class ShortcutCard extends StatelessWidget {
  final String icon, text;
  final GestureTapCallback press;
  final int tabIndex;

  const ShortcutCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
    required this.tabIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          // Icon container with background color and rounded corners.
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFFFECDF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon), // Displays the icon.
          ),
          const SizedBox(height: 4),
          // Label for the shortcut.
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
