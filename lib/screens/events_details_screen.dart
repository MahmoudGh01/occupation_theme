import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/JobInterviewEvent.dart';

class EventDetailsScreen extends StatelessWidget {
  final JobInterviewEvent event;

  const EventDetailsScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.description),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Guest: ${event.guestName}'),
            Text('Interviewer: ${event.interviewerName}'),
            Text('Date: ${DateFormat('d MMMM').format(event.dueDate)}'),
            Text('Time: ${event.startTime} - ${event.endTime}'),
            Text('Location: ${event.location}'),
            Text('Description: ${event.description}'),
            Text('Join link: ${event.joinLink}'),
            Text('Meeting ID: ${event.meetingId}'),
            Text('Password: ${event.password}'),
            // Add other event details as necessary
          ],
        ),
      ),
    );
  }
}
