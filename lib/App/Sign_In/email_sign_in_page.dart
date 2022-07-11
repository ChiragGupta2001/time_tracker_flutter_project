import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/email_sign_in_form.dart';
import 'package:time_tracker_flutter_project/App/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  final AuthBase auth;
  const EmailSignInPage({super.key, required this.auth});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Sign In'),
          elevation: 1.0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(child: EmailSignInForm(auth: auth)),
          ),
        ),
        backgroundColor: const Color.fromARGB(220, 255, 255, 255));
  }
}
