// SignIn screen for the MoonVocs app.
// This screen allows users to sign in with their email and password or through social media accounts.

import 'package:flutter/material.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import 'components/sign_form.dart';

/// The SignInScreen widget displays the sign-in page for the app.
///
/// This screen allows users to input their credentials or sign in via social media.
/// It uses the SignForm widget for form fields and SocalCard for social sign-in buttons.
class SignInScreen extends StatelessWidget {
  /// Route name for navigating to the SignInScreen.
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity, // Expands to full width.
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Welcome Back", // Title of the sign-in screen.
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Sign in with your email and password \n or continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  // Sign-in form widget
                  const SignForm(),
                  const SizedBox(height: 16),
                  // Social media sign-in buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocalCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocalCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Text with link to the sign-up screen for users without an account.
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}