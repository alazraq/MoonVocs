// Sign-in form widget for the MoonVocs app.
// This form collects the user's email and password and validates input before proceeding.

import 'package:flutter/material.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

/// The SignForm widget collects user credentials for the sign-in process.
///
/// It includes fields for the user’s email (or student ID) and password,
/// with validation checks for both. If valid, the user is directed to
/// the login success screen.
class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  // Global key for form state management.
  final _formKey = GlobalKey<FormState>();

  // User's email or student ID.
  String? identifier;

  // User's password.
  String? password;

  // Whether the user wants to be remembered for future logins.
  bool? remember = false;

  // List of form error messages.
  final List<String?> errors = [];

  /// Adds a form error message if it's not already present.
  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  /// Removes a form error message if it exists.
  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  /// Builds the form widget tree, which includes input fields for email and password,
  /// a "Remember me" checkbox, and a submit button.
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // Associates the form with the form state.
      child: Column(
        children: [
          // Email/ID input field
          TextFormField(
            keyboardType: TextInputType.text,
            onSaved: (newValue) => identifier = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "Please enter a valid email";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Email",
              hintText: "Enter your email address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Password input field
          TextFormField(
            obscureText: true,
            onSaved: (newValue) => password = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPassNullError);
              } else if (value.length >= 8) {
                removeError(error: kShortPassError);
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPassNullError);
                return "Please enter your password";
              } else if (value.length < 8) {
                addError(error: kShortPassError);
                return "Password is too short";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Password",
              hintText: "Enter your password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Remember me checkbox and forgot password link
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          // Error messages
          FormError(errors: errors),
          const SizedBox(height: 16),
          // Submit button
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // If all inputs are valid, navigate to the success screen.
                KeyboardUtil.hideKeyboard(context);
                Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}