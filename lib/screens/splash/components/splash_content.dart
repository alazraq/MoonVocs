// Splash content widget for the MoonVocs app splash screen.
// Displays an image and text for each splash screen slide.

import 'package:flutter/material.dart';
import '../../../constants.dart';

/// A widget that displays the splash content, including an image and text.
///
/// This widget is used inside the splash screen to show a slide with
/// an introductory message and an associated image.
class SplashContent extends StatefulWidget {
  // Constructor to accept text and image for the splash content.
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);

  // The text to be displayed on the splash screen slide.
  final String? text;

  // The image to be displayed on the splash screen slide.
  final String? image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  /// Builds the widget tree for the splash content, which includes an image
  /// and a text message centered in the column.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 2), // Adds space at the top of the slide.
        // Displays the splash image, with a set height and width.
        Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ),
        const Spacer(), // Adds space between the image and the text.
        // Displays the splash text, styled to match the app's theme.
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(), // Adds space at the bottom of the slide.
      ],
    );
  }
}