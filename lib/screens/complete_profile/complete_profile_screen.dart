// CompleteProfileScreen for the MoonVocs app.
// This screen allows users to complete their profile after sign-up.

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'components/complete_profile_form.dart';

/// The CompleteProfileScreen widget displays the form for completing a user profile.
///
/// After signing up, users are prompted to provide additional details like
/// their address and phone number. The screen also provides an agreement to
/// the terms and conditions.
class CompleteProfileScreen extends StatelessWidget {
  /// Route name for navigating to the CompleteProfileScreen.
  static String routeName = "/complete_profile";

  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'), // AppBar title for the screen.
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
                  // Heading for the profile completion screen.
                  const Text(
                    "Complete Profile",
                    style: headingStyle, // Custom style defined in constants.dart.
                  ),
                  const Text(
                    "Complete your details or continue  \nwith social media",
                    textAlign: TextAlign.center, // Aligns the text in the center.
                  ),
                  const SizedBox(height: 16),
                  // Form widget for completing profile information.
                  const CompleteProfileForm(),
                  const SizedBox(height: 30),
                  // Terms and conditions text.
                  Text(
                    "By continuing you confirm that you agree \nwith our Terms and Conditions",
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
