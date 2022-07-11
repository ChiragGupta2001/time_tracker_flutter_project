import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/App/landing_page.dart';
import 'package:time_tracker_flutter_project/App/services/auth.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyTimeApp());
}

class MyTimeApp extends StatelessWidget {
  const MyTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
    );
  }
}
