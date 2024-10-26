// ResourceCard widget for the MoonVocs app.
// This widget displays an individual resource card with an image and title, used in the ResourcesScreen and similar views.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';
import '../models/Resource.dart';

/// The ResourceCard widget displays a card with an image and title for a resource.
///
/// Each card can be tapped to view more details about the resource.
class ResourceCard extends StatelessWidget {
  const ResourceCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.resource,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRatio;
  final Resource resource;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image container with padding and rounded corners.
            AspectRatio(
              aspectRatio: aspectRatio,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(resource.images[0]), // Displaying resource image.
              ),
            ),
            const SizedBox(height: 8),
            // Title text for the resource.
            Text(
              resource.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
