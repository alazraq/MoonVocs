// SignUp screen for the MoonVocs app.
// This screen allows users to create an account by entering their details or using social media sign-in options.

import 'package:flutter/material.dart';

import '../../components/socal_card.dart';
import '../../constants.dart';
import 'components/sign_up_form.dart';

/// The SignUpScreen widget displays the registration page for the app.
///
/// Users can either complete the sign-up form with their details or continue
/// with social media sign-in options. A terms and conditions agreement is also shown.
class SignUpScreen extends StatelessWidget {
  /// Route name for navigating to the SignUpScreen.
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"), // AppBar title for the screen.
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity, // Expands the content to the full width of the screen.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  // Heading for the sign-up screen.
                  const Text(
                    "Register Account",
                    style: headingStyle, // Custom style defined in constants.dart.
                  ),
                  const Text(
                    "Complete your details or continue \nwith social media",
                    textAlign: TextAlign.center, // Aligns the text in the center.
                  ),
                  const SizedBox(height: 16),
                  // Sign-up form widget for entering details.
                  const SignUpForm(),
                  const SizedBox(height: 16),
                  // Social media sign-up options.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {}, // Add functionality for Google sign-in.
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {}, // Add functionality for Facebook sign-in.
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {}, // Add functionality for Twitter sign-in.
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Terms and conditions text.
                  Text(
                    'By continuing you confirm that you agree \nwith our Terms and Conditions',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
