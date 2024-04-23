import 'package:edit_calendar_event_view/edit_calendar_event_view.dart';
import 'package:edit_calendar_event_view/edit_calendar_event_view_method_channel.dart';
import 'package:flutter/material.dart';

class AddEventScreen extends StatefulWidget {
  @override
  _AddEventScreenState createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
   String? eventId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add/Edit Event Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    final result = await EditCalendarEventView.addOrEditCalendarEvent( context , title: "exampleTitle");
                    setState(() {
                      switch(result.resultType) {
                        case ResultType.saved:
                          eventId = result.eventId;
                          break;
                        case ResultType.deleted:
                          eventId = null;
                          break;
                        case ResultType.unknown:
                          break;
                        case ResultType.canceled:
                          // TODO: Handle this case.
                      }
                    });
                  },
                  child: Text('Add event'),
                ),
                if (eventId != null)
                ElevatedButton(
                  onPressed: () async {
                    // ignore: unnecessary_this
                    final result = await EditCalendarEventView.addOrEditCalendarEvent( context , eventId: this.eventId);
                    setState(() {
                      switch(result.resultType) {
                        case ResultType.saved:
                          eventId = result.eventId;
                          break;
                        case ResultType.deleted:
                          eventId = null;
                          break;
                        case ResultType.unknown:
                          break;
                        case ResultType.canceled:
                          // TODO: Handle this case.
                      }
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Edit event\n$eventId',
                    textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
      ),
    ));
  }
}

