// Splash screen for the MoonVocs app.
// Displays an introduction to the app with sliding pages and a continue button.

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../sign_in/sign_in_screen.dart';
import 'components/splash_content.dart';

/// The SplashScreen widget displays a set of introductory slides for the app.
///
/// This screen is the first that users see and includes a page view for sliding
/// between different splash content. It also features an animated indicator
/// and a button that navigates to the Sign In screen.
class SplashScreen extends StatefulWidget {
  /// Route name for navigating to the SplashScreen.
  static String routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Tracks the currently active page in the splash screen.
  int currentPage = 0;

  // Splash data contains the text and image assets for each splash slide.
  List<Map<String, String>> splashData = [
    {
      "text": "Full potential!",
      "image": "assets/images/splash_1.png"
    },
  ];

  /// Builds the widget tree for the splash screen, which includes a
  /// [PageView] for slides and an indicator for the current slide.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity, // Expands to the full width of the screen.
          child: Column(
            children: <Widget>[
              // The sliding splash content (image and text)
              Expanded(
                flex: 3,
                child: PageView.builder(
                  // Updates the current page when the user swipes.
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                  itemBuilder: (context, index) => SplashContent(
                    image: splashData[index]["image"],
                    text: splashData[index]['text'],
                  ),
                ),
              ),
              // The bottom section with page indicators and the continue button.
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      const Spacer(), // Adds space between the slider and indicators.
                      // Page indicators: show the current page with animation.
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashData.length,
                              (index) => AnimatedContainer(
                            duration: kAnimationDuration,
                            margin: const EdgeInsets.only(right: 5),
                            height: 6,
                            width: currentPage == index ? 20 : 6,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColor
                                  : const Color(0xFFD8D8D8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      // Continue button to navigate to the sign-in screen.
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        },
                        child: const Text("Continue"),
                      ),
                      const Spacer(), // Adds space after the button.
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}