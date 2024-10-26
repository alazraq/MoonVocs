// HomeHeader widget for the MoonVocs app's HomeScreen.
// This widget displays a search bar and a notification icon with a counter.

import 'package:flutter/material.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

/// The HomeHeader widget displays a search field and a notification button.
///
/// This widget is located at the top of the HomeScreen, allowing users
/// to search for products and view notifications.
class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Search field component
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          // Notification button with counter for unread items.
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3, // Number of unread notifications.
            press: () {}, // Define notification action here.
          ),
        ],
      ),
    );
  }
}
