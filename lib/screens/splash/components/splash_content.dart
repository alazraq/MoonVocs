import 'package:flutter/material.dart';

import '../../../constants.dart';

class SplashContent extends StatefulWidget {
  const SplashContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(flex: 2),  // Adjusted to add space at the top
        Image.asset(
          widget.image!,
          height: 265,
          width: 235,
        ),
        const Spacer(),  // Add space between image and text
        Text(
          widget.text!,
          textAlign: TextAlign.center,
          style: const TextStyle( // Optional: Add some styling to the text
            fontSize: 22,
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),  // Add space at the bottom
      ],
    );
  }
}
