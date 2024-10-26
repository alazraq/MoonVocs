// InspirationSection widget for the MoonVocs app.
// This widget displays a horizontal scrollable section with inspiration cards,
// each representing a category of resources, like "Informatique" or "Fashion."

import 'package:flutter/material.dart';
import 'package:shop_app/screens/resources/resources_screen.dart';
import 'section_title.dart';

/// The InspirationSection widget displays a row of cards representing different
/// categories, encouraging students to explore topics that inspire them.
class InspirationSection extends StatelessWidget {
  const InspirationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title section with a label and action button.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Trouver de l'inspiration",
            press: () {
              // Action for title button (define functionality here if needed).
            },
          ),
        ),
        // Horizontal scrollable row of inspiration cards.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              // Inspiration card for the "Informatique" category.
              InspirationCard(
                image: "assets/images/Image Banner 2.png",
                category: "Informatique",
                numOfTopics: 18,
                press: () {
                  Navigator.pushNamed(context, ResourcesScreen.routeName);
                },
              ),
              // Inspiration card for the "Fashion" category.
              InspirationCard(
                image: "assets/images/Image Banner 3.png",
                category: "Fashion",
                numOfTopics: 12,
                press: () {
                  Navigator.pushNamed(context, ResourcesScreen.routeName);
                },
              ),
              const SizedBox(width: 20), // Extra space at the end.
            ],
          ),
        ),
      ],
    );
  }
}

/// The InspirationCard widget displays an individual category card with an image,
/// title, and description of the number of related topics or métiers.
class InspirationCard extends StatelessWidget {
  final String category, image;
  final int numOfTopics;
  final GestureTapCallback press;

  const InspirationCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfTopics,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                // Background image for the inspiration card.
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                // Gradient overlay to enhance text readability.
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Text content with category name and number of topics.
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfTopics métiers"),
                      ],
                    ),
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
