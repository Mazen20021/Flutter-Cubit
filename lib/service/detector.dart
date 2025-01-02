import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screen/caller_screen.dart';

class CallerDetector extends StatefulWidget {
  @override
  _CallerDetectorState createState() => _CallerDetectorState();
}

class _CallerDetectorState extends State<CallerDetector> {
  static const EventChannel _eventChannel = EventChannel('caller_event_channel');

  String? callerNumber;

  @override
  void initState() {
    super.initState();
    _listenForIncomingCalls();
  }

  void _listenForIncomingCalls() {
    _eventChannel.receiveBroadcastStream().listen((event) {
      setState(() {
        callerNumber = event;
      });

      // Navigate to CallerScreen
      if (callerNumber != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CallerScreen(
              phoneNumber: callerNumber!,
              callerName: "Unknown", // You can fetch the name if implemented.
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Caller Detector")),
      body: Center(
        child: Text(callerNumber != null
            ? "Incoming call from $callerNumber"
            : "Waiting for a call..."),
      ),
    );
  }
}
