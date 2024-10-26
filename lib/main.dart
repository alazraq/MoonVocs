// Main entry point of the MoonVocs Flutter application.
// This file initializes date formatting and starts the app.

import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'routes.dart';
import 'theme.dart';

/// Main function to initialize the app.
/// Initializes date formatting and starts the MyApp widget.
void main() {
  // Ensure date formatting is available before starting the app.
  initializeDateFormatting().then((_) {
    runApp(const MoonVocsApp());
  });
}

/// Root widget of the MoonVocs app.
///
/// This widget defines the core of the application, including the theme,
/// initial route, and available routes. It extends the [StatelessWidget] 
/// because it doesn't require mutable state.
class MoonVocsApp extends StatelessWidget {
  // Constructor for MoonVocsApp.
  const MoonVocsApp({super.key});

  /// Builds the widget tree for the MoonVocs app.
  ///
  /// This method is responsible for setting up the MaterialApp, which includes
  /// the theme, routes, and disabling the debug banner.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner in the app.
      title: 'MoonVocs App', // Sets the app title.
      theme: AppTheme.lightTheme(context), // Applies the custom light theme.
      initialRoute: SplashScreen.routeName, // Defines the initial route.
      routes: routes, // Sets the routes for navigation.
    );
  }
}