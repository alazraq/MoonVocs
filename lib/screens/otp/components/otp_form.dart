// OtpForm for the MoonVocs app.
// This form allows users to input the OTP (One-Time Password) for verification.

import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_up_success/sign_up_success_screen.dart';
import '../../../constants.dart';

/// The OtpForm widget collects the user's OTP input and verifies it.
///
/// The form uses four input fields to accept the OTP digits. Focus is shifted
/// automatically between fields as the user inputs their OTP.
class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  // Focus nodes to manage focus between OTP input fields.
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Dispose of focus nodes to free up resources.
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    super.dispose();
  }

  /// Moves the focus to the next input field if the current field is filled.
  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          // Adds spacing above the OTP input fields.
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          // Row for OTP input fields.
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // OTP digit input fields.
              SizedBox(
                width: 60,
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin3FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) => nextField(value, pin4FocusNode),
                ),
              ),
              SizedBox(
                width: 60,
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: const TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    if (value.length == 1) {
                      pin4FocusNode!.unfocus();
                      // You can check if the entered OTP is correct here.
                    }
                  },
                ),
              ),
            ],
          ),
          // Adds spacing below the OTP input fields.
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          // Continue button to submit the OTP and verify.
          ElevatedButton(
            onPressed: () {
              // Mock OTP verification success (adjust logic for real OTP verification).
              bool isOtpValid = true; // Assuming OTP is valid for testing purposes.

              if (isOtpValid) {
                // Navigate to the success screen if OTP is valid.
                Navigator.pushNamed(context, SignUpSuccessScreen.routeName);
              } else {
                // Show error message if OTP is invalid (not implemented in this mock setup).
              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
