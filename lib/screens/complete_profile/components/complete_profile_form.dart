// CompleteProfileForm for the MoonVocs app.
// This form collects additional details about the user, such as first name, last name, phone number, and birth date.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // For date formatting

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../otp/otp_screen.dart';

/// The CompleteProfileForm widget collects additional user details after sign-up.
///
/// This form asks the user for information like their first name, last name,
/// phone number, school, and educational level. It also includes error handling
/// and validation for the form fields.
class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({super.key});

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  // Global key for form state management.
  final _formKey = GlobalKey<FormState>();

  // List of form error messages.
  final List<String?> errors = [];

  // User information fields.
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? birthDate;
  String? school;
  String? level;

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

  /// Allows the user to select their birth date using a date picker.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDate = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  /// Builds the form widget tree, which includes input fields for first name, last name,
  /// birth date, school, educational level, and phone number.
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // First Name input field
          TextFormField(
            onSaved: (newValue) => firstName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "First Name",
              hintText: "Enter your first name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Last Name input field
          TextFormField(
            onSaved: (newValue) => lastName = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kNamelNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kNamelNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Last Name",
              hintText: "Enter your last name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Birth Date input field with date picker
          TextFormField(
            readOnly: true,
            onTap: () => _selectDate(context),
            decoration: InputDecoration(
              labelText: "Birth Date",
              hintText: birthDate ?? "Select your birth date",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Calendar.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // School input field
          TextFormField(
            onSaved: (newValue) => school = newValue,
            decoration: const InputDecoration(
              labelText: "School",
              hintText: "Enter your school name",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/School.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Educational level dropdown menu
          DropdownButtonFormField<String>(
            value: level,
            items: <String>['Primary School', 'Middle School', 'High School']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                level = newValue;
              });
            },
            decoration: const InputDecoration(
              labelText: "Level",
              hintText: "Select your level",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Level.svg"),
            ),
          ),
          const SizedBox(height: 20),
          // Phone Number input field
          TextFormField(
            keyboardType: TextInputType.phone,
            onSaved: (newValue) => phoneNumber = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kPhoneNumberNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kPhoneNumberNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Phone Number",
              hintText: "Enter your phone number",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
            ),
          ),
          const SizedBox(height: 20),
          /*
          // Address input field (optional, uncomment if needed)
          TextFormField(
            onSaved: (newValue) => address = newValue,
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kAddressNullError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kAddressNullError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Address",
              hintText: "Enter your address",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
            ),
          ),
          */
          // Display error messages if any
          FormError(errors: errors),
          const SizedBox(height: 20),
          // Continue button to proceed to OTP verification
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
            child: const Text("Continue"),
          ),
        ],
      ),
    );
  }
}
