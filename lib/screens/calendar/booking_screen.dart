import 'package:flutter/material.dart';
import 'package:shop_app/screens/calendar/psychologues_screen.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prenez rendez-vous avec un professionnel',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Makes text bold
            fontSize: 15.0, // Increases font size, adjust the value as needed
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildCategoryCard(context, 'Psychologues et coachs d\'orientation', Icons.psychology, const PsychologuesScreen()),
          _buildCategoryCard(context, 'Experts candidatures', Icons.school, const PsychologuesScreen()),
          _buildCategoryCard(context, 'Experts métiers', Icons.work, const PsychologuesScreen()),
          _buildCategoryCard(context, 'Experts démarches administratives', Icons.admin_panel_settings, const PsychologuesScreen()),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, IconData icon, Widget destinationScreen) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationScreen),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48.0),
            Text(title, textAlign: TextAlign.center),
            // Replace with actual images when available
          ],
        ),
      ),
    );
  }
}
