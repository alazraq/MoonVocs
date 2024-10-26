// UserProgressBanner widget for the MoonVocs app.
// This widget displays a personalized greeting with user progress on objectives and missions.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// The UserProgressBanner widget shows a greeting and user progress summary.
///
/// It includes the user's first name and displays the count of completed
/// objectives and missions. These values will be made dynamic in the future.
class UserProgressBanner extends StatelessWidget {
  const UserProgressBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298), // Background color for the banner.
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, 5), // Shadow positioning.
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Greeting text placeholder (to be made dynamic).
          const Text(
            "Hello Youssouf!", // Placeholder for user’s first name.
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20), // Space between greeting and progress.

          // Row displaying objectives and missions progress.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Objective column showing completed objectives.
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Plus Icon.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    width: 24, // Icon size.
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "1 Objectif validé", // Placeholder for objectives count.
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Mission column showing completed missions.
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/icons/Success.svg',
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    width: 24, // Icon size.
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "0 Mission complétée", // Placeholder for missions count.
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
