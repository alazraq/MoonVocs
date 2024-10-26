// IconBtnWithCounter widget for the MoonVocs app.
// This widget displays an icon button with an optional counter for notifications or cart items.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

/// The IconBtnWithCounter widget shows an icon with an optional counter badge.
///
/// It indicate the number of notifications.
class IconBtnWithCounter extends StatelessWidget {
  /// Path to the SVG icon asset.
  final String svgSrc;

  /// Number to display in the counter badge. Defaults to 0.
  final int numOfitem;

  /// Callback function triggered on icon tap.
  final GestureTapCallback press;

  const IconBtnWithCounter({
    Key? key,
    required this.svgSrc,
    this.numOfitem = 0,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100), // Circular border effect on tap.
      onTap: press, // Defines the tap action.
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Icon button container with background color and circular shape.
          Container(
            padding: const EdgeInsets.all(12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1), // Light background color.
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(svgSrc), // Displays the SVG icon.
          ),
          // Counter badge positioned in the top-right corner.
          if (numOfitem != 0)
            Positioned(
              top: -3,
              right: 0,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF4848), // Badge background color.
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5, color: Colors.white), // White border around badge.
                ),
                child: Center(
                  child: Text(
                    "$numOfitem", // Displays the item count.
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // Text color.
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
