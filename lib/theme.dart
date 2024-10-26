// This file defines the light theme for the MoonVocs app, which includes
// styles for the app's color scheme, text styles, and input decorations.

import 'package:flutter/material.dart';

import 'constants.dart';

/// A class containing the app's theme configuration.
///
/// The [AppTheme] class provides a light theme for the MoonVocs app, defining
/// styles for common elements like text, app bars, and input fields.
class AppTheme {
  /// Returns the light theme configuration for the app.
  ///
  /// This method applies custom styles for app bars, text, buttons, and input
  /// fields. It also ensures that the theme is adaptive across different devices.
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white, // Sets the background color.
      fontFamily: "Muli", // Defines the default font for the app.

      // Configures the appearance of the AppBar widget.
      appBarTheme: const AppBarTheme(
        color: Colors.white, // AppBar background color.
        elevation: 0, // Removes the shadow below the AppBar.
        iconTheme: IconThemeData(color: Colors.black), // Icon color in the AppBar.
        titleTextStyle: TextStyle(color: Colors.black), // AppBar title style.
      ),

      // Defines the default text styles used throughout the app.
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: kTextColor),
        bodyMedium: TextStyle(color: kTextColor),
        bodySmall: TextStyle(color: kTextColor),
      ),

      // Configures the default appearance of input fields.
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),

      visualDensity: VisualDensity.adaptivePlatformDensity, // Adjusts layout density for different platforms.

      // Styles for ElevatedButton widgets.
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: kPrimaryColor, // Button background color.
          foregroundColor: Colors.white, // Button text color.
          minimumSize: const Size(double.infinity, 48), // Button size.
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)), // Button shape with rounded corners.
          ),
        ),
      ),
    );
  }
}

/// Defines the appearance of input borders used in forms and text fields.
const OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(28)), // Rounded corners for the border.
  borderSide: BorderSide(color: kTextColor), // Border color.
  gapPadding: 10, // Padding around the text inside the border.
);