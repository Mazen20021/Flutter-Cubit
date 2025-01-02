import 'package:cubittest/cubit/Cubit.dart';
import 'package:cubittest/screen/button_test.dart';
import 'package:cubittest/screen/caller_screen.dart';
import 'package:cubittest/service/mob_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    requestPermissions();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: BlocProvider(create: (context) => AppCubic(),
      child: const CallerScreen(callerName: "Mazen",phoneNumber: "010",),
      )
    );
  }


  void requestPermissions() async {
    await [
      Permission.phone,
      Permission.contacts,
    ].request();
  }

}
