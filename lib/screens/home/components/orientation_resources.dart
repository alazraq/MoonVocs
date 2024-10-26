// OrientationResources widget for the MoonVocs app.
// This widget displays a selection of resources to help students with their orientation project.

import 'package:flutter/material.dart';

import '../../../components/resource_card.dart';
import '../../../models/Resource.dart';
import '../../details/details_screen.dart';
import '../../resources/resources_screen.dart';
import 'section_title.dart';

/// The OrientationResources widget provides a set of resources to support
/// students in their orientation project.
///
/// This section displays a horizontal scrollable list of resources.
class OrientationResources extends StatelessWidget {
  const OrientationResources({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title section with navigation to the full resources screen.
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Construire mon projet d'orientation",
            press: () {
              Navigator.pushNamed(context, ResourcesScreen.routeName);
            },
          ),
        ),
        // Horizontal scrollable list of resource cards.
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoResources.length,
                    (index) {
                  if (demoResources[index].isPopular) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ResourceCard(
                        resource: demoResources[index],
                        onPress: () => Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                          arguments: ResourceDetailsArguments(
                            resource: demoResources[index],
                          ),
                        ),
                      ),
                    );
                  }

                  return const SizedBox.shrink(); // Placeholder for non-popular resources.
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
