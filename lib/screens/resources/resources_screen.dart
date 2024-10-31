// ResourcesScreen for the MoonVocs app.
// This screen displays a grid of educational resources to support students in their orientation project.

import 'package:flutter/material.dart';
import 'package:shop_app/components/resource_card.dart';
import 'package:shop_app/models/Resource.dart';

import '../details/resource_details_screen.dart';

/// The ResourcesScreen widget displays a grid view of educational resources.
///
/// Each resource is displayed as a card, and tapping a card navigates to a
/// detailed view of the resource.
class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({super.key});

  static String routeName = "/resources";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resources"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoResources.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ResourceCard(
              resource: demoResources[index],
              onPress: () => Navigator.pushNamed(
                context,
                ResourceDetailsScreen.routeName,
                arguments: ResourceDetailsArguments(
                  resource: demoResources[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
