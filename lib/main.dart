import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'routes.dart';
import 'theme.dart';

void main() {
  initializeDateFormatting().then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MoonVocs App',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
