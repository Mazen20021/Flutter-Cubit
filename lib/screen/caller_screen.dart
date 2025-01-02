import 'package:flutter/material.dart';

class CallerScreen extends StatelessWidget {
  final String phoneNumber;
  final String callerName;

  const CallerScreen({super.key, required this.phoneNumber, required this.callerName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Incoming Call")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Caller: $callerName", style: const TextStyle(fontSize: 24)),
            Text("Phone: $phoneNumber", style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
