import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final List<String> _professionalTypes = [
    'Psychologues',
    'Coachs et conseillers en orientation scolaire',
    'Experts métiers',
  ];
  String? _selectedProfessionalType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book an Appointment'),
      ),
      body: SingleChildScrollView( // Allows the screen to be scrollable
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField<String>(
                value: _selectedProfessionalType,
                items: _professionalTypes.map((type) => DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                )).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProfessionalType = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Professional Type',
                  contentPadding: EdgeInsets.symmetric(horizontal: 6.0, // Reduced padding
                      vertical: 8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ],
        ),
      ),
    );
  }
}
