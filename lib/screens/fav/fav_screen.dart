import 'package:flutter/material.dart';
import '../home/components/search_field.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);

  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  // Examples of métiers and formations, replace with your actual data
  final List<Map<String, dynamic>> metiers = [
    {'title': 'Agent Arboricole', 'image': 'assets/images/agent_arboricole.jpeg'},
    {'title': 'Agriculteur', 'image': 'assets/images/agriculteur.jpeg'},
  ];

  final List<Map<String, dynamic>> formations = [
    {'title': 'EPFL', 'image': 'assets/images/EPFL.png'},
    {'title': 'CMU', 'image': 'assets/images/CMU.png'},
  ];

  // A simple grid item builder function
  Widget buildGridItem(Map<String, dynamic> item) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.antiAlias, // Ensures the image (or any other content) does not bleed over the edges of the card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch the column's children to fit the card's width
        children: <Widget>[
          Expanded(
            child: Image.asset(
              item['image'], // Replace with your actual image path
              fit: BoxFit.cover, // Cover the entire space of the container (cropping if necessary)
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    item['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevents the text from overflowing
                  ),
                ),
                const Icon(Icons.favorite, color: Colors.red, size: 14.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Build a grid for métiers or formations
  Widget buildGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two items per row
        childAspectRatio: 1.0, // Adjust the ratio to make the items square
        crossAxisSpacing: 10, // Spacing between the items horizontally
        mainAxisSpacing: 10, // Spacing between the items vertically
      ),
      itemCount: items.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) => buildGridItem(items[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color tabBarLabelColor = Colors.black; // Adjust the color to match your theme
    Color tabBarUnselectedLabelColor = Colors.black; // Adjust the color to match your theme

    return DefaultTabController(
      length: 2, // The number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const SearchField(),
          bottom: TabBar(
            labelColor: tabBarLabelColor,
            unselectedLabelColor: tabBarUnselectedLabelColor,
            indicatorColor: Color(0xFF8E24AA),
            tabs: const [
              Tab(text: 'Métiers'),
              Tab(text: 'Formations'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // The first tab content for métiers
            buildGrid(metiers),
            // The second tab content for formations
            buildGrid(formations),
          ],
        ),
        // BottomNavigationBar should be here if you need it
      ),
    );
  }
}
