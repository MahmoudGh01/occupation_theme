import 'package:flutter/material.dart';
import 'package:calendar_view/calendar_view.dart';

import 'add_event_scren.dart';
 // Assuming you have this file created for event details

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late final EventController<CalendarEventData> _controller;

  @override
  void initState() {
    super.initState();
    _controller = EventController();
    // ... Initialize events here if any
  }

  void _onDateTap(DateTime date) {
    var events = _controller.getEventsOnDay(date);
    if (events.isEmpty) {
      // If there are no events for this date, navigate to the AddEventScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => AddEventScreen(),
        ),
      );
    } else {
      // If there are events, navigate to the EventDetailsPage
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EventDetailsPage(event: events.first),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar View'),
      ),
      body: MonthView(
        controller: _controller,
         onCellTap: (List<CalendarEventData> events, DateTime date) {
          if (events.isEmpty) {
            // If there are no events for this date, navigate to the AddEventScreen
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddEventScreen(),
            ));   
          } else {
            // If there are events, navigate to the EventDetailsPage with the first event
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventDetailsPage(event: events.first),
            ));
          }
        },
        // If your calendar view package supports onEventTap, you can use it
        // Otherwise, you'll need to handle event taps within the onDateTap by checking if there are events for the tapped date
      ),
    );
  }
}


class EventDetailsPage extends StatelessWidget {
  final CalendarEventData event;

  EventDetailsPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(event.title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(event.description.toString()),
            // Display other event details as needed
          ],
        ),
      ),
    );
  }
}
