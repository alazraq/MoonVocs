// SignUpSuccessScreen for the MoonVocs app.
// This screen confirms that the user has successfully signed up and provides a button to proceed to the main part of the app.

import 'package:flutter/material.dart';
import 'package:shop_app/screens/init_screen.dart';

/// The SignUpSuccessScreen widget displays a confirmation message
/// after the user has successfully signed up.
///
/// The screen includes an image, a success message, and a button to proceed to the main app.
class SignUpSuccessScreen extends StatelessWidget {
  /// Route name for navigating to the SignUpSuccessScreen.
  static String routeName = "/login_success";

  const SignUpSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Hides the default back button from the AppBar.
        leading: const SizedBox(),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Success image taking up 40% of the screen height.
          Expanded(
            child: Image.asset(
              "assets/images/success.png",
              height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height.
            ),
          ),
          const SizedBox(height: 16),
          // Success message text.
          const Text(
            "Sign up Success",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          // Button to navigate to the InitScreen.
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                // Navigates to the InitScreen after successful sign-up.
                Navigator.pushNamed(context, InitScreen.routeName);
              },
              child: const Text("Construisons ensemble ton avenir !"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
