// OTPScreen for the MoonVocs app.
// This screen allows users to enter the OTP (One-Time Password) sent to their phone number for verification.

import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/otp_form.dart';

/// The OtpScreen widget displays the OTP verification screen.
///
/// After completing the sign-up or profile process, users are prompted to enter
/// an OTP code sent to their phone number. The screen includes a countdown timer
/// for the OTP expiration and an option to resend the code.
class OtpScreen extends StatelessWidget {
  /// Route name for navigating to the OtpScreen.
  static String routeName = "/otp";

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"), // AppBar title for the screen.
      ),
      body: SizedBox(
        width: double.infinity, // Expands the content to the full width of the screen.
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Heading for the OTP verification screen.
                const Text(
                  "OTP Verification",
                  style: headingStyle, // Custom style defined in constants.dart.
                ),
                // Information about the phone number to which the OTP was sent.
                const Text("We sent your code to +1 898 860 ***"),
                // Countdown timer for OTP expiration.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("This code will expire in "),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 30.0, end: 0.0),
                      duration: const Duration(seconds: 30),
                      builder: (_, dynamic value, child) => Text(
                        "00:${value.toInt()}",
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                // Form to input the OTP.
                const OtpForm(),
                const SizedBox(height: 20),
                // Resend OTP link.
                GestureDetector(
                  onTap: () {
                    // Logic for resending the OTP code goes here.
                  },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
