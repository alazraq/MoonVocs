// ResourceDetailsScreen for the MoonVocs app.
// This screen displays detailed information about a specific educational resource.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/Resource.dart';
import 'components/resource_description.dart';
import 'components/resource_images.dart';
import 'components/top_rounded_container.dart';

/// The ResourceDetailsScreen widget displays detailed information for a specific resource,
/// such as images, description, and color options.
class ResourceDetailsScreen extends StatelessWidget {
  static String routeName = "/resource_details";

  const ResourceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieves the resource argument passed to the screen.
    final ResourceDetailsArguments args =
    ModalRoute.of(context)!.settings.arguments as ResourceDetailsArguments;
    final resource = args.resource;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
              size: 20,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text(
                      "4.7", // Static rating placeholder.
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset("assets/icons/Star Icon.svg"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          // Displays images related to the resource.
          ResourceImages(resource: resource),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                // Description section for the resource.
                ResourceDescription(
                  resource: resource,
                  pressOnSeeMore: () {}, // Optional "See More" functionality.
                ),
              ],
            ),
          ),
        ],
      ),
      // Bottom navigation to save the resource.
      bottomNavigationBar: TopRoundedContainer(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: ElevatedButton(
              onPressed: () {
              },
              child: const Text("Start"),
            ),
          ),
        ),
      ),
    );
  }
}

/// Arguments passed to the ResourceDetailsScreen, containing the resource information.
class ResourceDetailsArguments {
  final Resource resource;

  ResourceDetailsArguments({required this.resource});
}
