// favorites_screen.dart - Manages and displays user's favorite items across "Métiers" and "Formations" categories

import 'package:flutter/material.dart';
import '../home/components/search_field.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Sample data for "Métiers" favorites; replace with actual data source as needed
  final List<Map<String, dynamic>> metiers = [
    {'title': 'Agent Arboricole', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Agriculteur', 'image': 'assets/images/agriculteur.jpeg'},
  ];

  // Sample data for "Formations" favorites; replace with actual data source as needed
  final List<Map<String, dynamic>> formations = [
    {'title': 'EPFL', 'image': 'assets/images/EPFL.png'},
    {'title': 'CMU', 'image': 'assets/images/CMU.png'},
  ];

  /// Builds a single card for a grid item, including title and a favorite icon.
  Widget buildGridItem(Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias, // Ensures image or content stays within card's rounded borders
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Aligns all items to fill card width
        children: <Widget>[
          Expanded(
            child: Image.asset(
              item['image'], // Displays the associated image
              fit: BoxFit.cover, // Covers the container area, cropping if necessary
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    item['title'], // Displays the item title
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevents text overflow
                  ),
                ),
                const Icon(Icons.favorite, color: Colors.red, size: 14.0), // Favorite icon
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a grid layout for either "Métiers" or "Formations" items.
  Widget buildGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Displays two items per row
        childAspectRatio: 1.0, // Sets the aspect ratio for square items
        crossAxisSpacing: 10, // Horizontal spacing between grid items
        mainAxisSpacing: 10, // Vertical spacing between grid items
      ),
      itemCount: items.length, // Number of items to display
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => buildGridItem(items[index]), // Builds each grid item
    );
  }

  @override
  Widget build(BuildContext context) {
    // Colors for the selected and unselected tabs
    Color tabBarLabelColor = Colors.black;
    Color tabBarUnselectedLabelColor = Colors.black;

    return DefaultTabController(
      length: 2, // Specifies two tabs: one for "Métiers" and another for "Formations"
      child: Scaffold(
        appBar: AppBar(
          title: const SearchField(), // Search field at the top for quick lookups
          bottom: TabBar(
            labelColor: tabBarLabelColor,
            unselectedLabelColor: tabBarUnselectedLabelColor,
            indicatorColor: const Color(0xFF8E24AA), // Color for active tab indicator
            tabs: const [
              Tab(text: 'Métiers'), // First tab for "Métiers" favorites
              Tab(text: 'Formations'), // Second tab for "Formations" favorites
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildGrid(metiers), // Displays "Métiers" items in grid view
            buildGrid(formations), // Displays "Formations" items in grid view
          ],
        ),
      ),
    );
  }
}
