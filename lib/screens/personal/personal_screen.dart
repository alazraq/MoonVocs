import 'package:flutter/material.dart';
import 'package:shop_app/screens/calendar/psychologues_screen.dart';
import 'package:shop_app/screens/personal/psychology_test_screen.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Je construis mon projet d\'orientation',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Makes text bold
            fontSize: 15.0, // Increases font size, adjust the value as needed
          ),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: <Widget>[
          _buildCategoryCard(context, 'J\'apprends à mieux me connaître', Icons.psychology, const PsychologyTestScreen()),
          _buildCategoryCard(context, 'Je découvre mes talents', Icons.draw, const PsychologuesScreen()),
          _buildCategoryCard(context, 'J\'explore mes centres d\'interêt', Icons.sports_basketball, const PsychologuesScreen()),
          _buildCategoryCard(context, 'Je souhaite être accompagné par un expert', Icons.admin_panel_settings, const PsychologuesScreen()),
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
