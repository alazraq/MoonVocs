import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:flutter/cupertino.dart';

class BookingCalendarScreen extends StatefulWidget {
  const BookingCalendarScreen({Key? key}) : super(key: key);

  @override
  _BookingCalendarScreenState createState() => _BookingCalendarScreenState();
}

class _BookingCalendarScreenState extends State<BookingCalendarScreen> {
  final DateTime now = DateTime.now();
  late BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    mockBookingService = BookingService(
      serviceName: 'Mock Service',
      serviceDuration: 30,
      bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
      bookingStart: DateTime(now.year, now.month, now.day, 8, 0),
    );
  }

  Stream<dynamic>? getBookingStreamMock({required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock({required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    // Navigate to PaymentScreen
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentScreen()),
    );
    return 'Uploaded';
  }

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    // Mock conversion logic
    return [];
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
          start: DateTime(now.year, now.month, now.day, 12, 0),
          end: DateTime(now.year, now.month, now.day, 13, 0))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Réservation'),
      ),
      body: Center(
        child: BookingCalendar(
          bookingService: mockBookingService,
          convertStreamResultToDateTimeRanges: convertStreamResultMock,
          getBookingStream: getBookingStreamMock,
          uploadBooking: uploadBookingMock,
          pauseSlots: generatePauseSlots(),
          pauseSlotText: 'Not Available',
          hideBreakTime: false,
          loadingWidget: const Text('Fetching data...'),
          uploadingWidget: const CircularProgressIndicator(),
          locale: 'en_US',
          startingDayOfWeek: StartingDayOfWeek.monday,
        ),
      ),
    );
  }
}

class PaymentScreen extends StatelessWidget {
  static const IconData apple = IconData(0xf04be, fontFamily: 'MaterialIcons');
  static const IconData paypal = IconData(0xf0545, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                // Implement card payment logic
                print('Card Payment Selected');
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(CupertinoIcons.creditcard, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Pay with Card', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement Apple Pay logic
                print('Apple Pay Selected');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Apple Pay button is typically black
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(apple, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Pay with Apple Pay', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement PayPal payment logic
                print('PayPal Selected');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003087), // PayPal's blue color
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(paypal, color: Colors.white),
                  SizedBox(width: 8),
                  Text('Pay with PayPal', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
