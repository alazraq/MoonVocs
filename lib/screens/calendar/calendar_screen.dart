import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  CalendarScreenState createState() => CalendarScreenState();
}

class CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat = CalendarFormat.month;
  late DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _availableTimeslots = {};
  List<String>? _selectedTimeslots;

  @override
  void initState() {
    super.initState();
    // Populate the _availableTimeslots with some sample data
    DateTime today = DateTime.now();
    DateTime todayWithoutTime = DateTime(today.year, today.month, today.day);
    _availableTimeslots[todayWithoutTime] = ['9:00 AM', '11:00 AM', '2:00 PM'];
    _availableTimeslots[todayWithoutTime.add(Duration(days: 1))] = ['10:00 AM', '1:00 PM', '3:00 PM'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prenez rendez-vous avec un professionnel'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  // Ensure we get the timeslots for the selected day without time component
                  DateTime dateKey = DateTime(selectedDay.year, selectedDay.month, selectedDay.day);
                  _selectedTimeslots = _availableTimeslots[dateKey];
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
            if (_selectedTimeslots != null) ..._selectedTimeslots!.map((timeslot) => ListTile(
              title: Text(timeslot),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()),
                );
              },
            )).toList(),
          ],
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}
