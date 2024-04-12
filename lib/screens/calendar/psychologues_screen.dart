import 'package:flutter/material.dart';
import 'package:shop_app/screens/calendar/calendar_screen.dart';

import 'booking_calendar_screen.dart';

class PsychologuesScreen extends StatelessWidget {
  const PsychologuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Psychologues d\'orientation',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Makes text bold
            fontSize: 20.0, // Increases font size, adjust the value as needed
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 3, // This should be the length of your items
        itemBuilder: (context, index) {
          return _buildProfessionalCard(context);
        },
      ),
    );
  }

  Widget _buildProfessionalCard(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/Profile Image Youssouf.png',
            width: 130.0, // Example width, adjust as needed
            height: 130.0, // Example height, adjust as needed
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Youssouf Lebbar',
              style: TextStyle(
                fontSize: 20.0, // Larger font size for the name
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text(
              'Founder & CEO at Moonweds, EPFL Alumni, Personal development expert, Psychology expert, Sadi9, Rajaal, Ismant',
              style: TextStyle(
                fontSize: 14.0, // Smaller font size for the description
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Tarif de consultation: 100€ /30 min', // Example price
              style: TextStyle(
                fontSize: 16.0, // A different font size for the price
                fontWeight: FontWeight.bold,
                color: Colors.purple, // Set the price text in purple
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Réservez maintenant'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const BookingCalendarScreen()// const CalendarScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


}
