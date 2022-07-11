import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/email_sign_in_page.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/sign_in_button.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/social_sign_in_button.dart';
import 'package:time_tracker_flutter_project/App/services/auth.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.auth});
  final AuthBase auth;

  Future<void> _signInAnonymously() async {
    try {
      await auth.signInAnonymously();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> _signInWithGoogle() async {
    try {
      await auth.signInWithGoogle();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Time Tracker'),
          elevation: 1.0,
        ),
        body: _buildContent(context),
        backgroundColor: const Color.fromARGB(220, 255, 255, 255));
  }

  Padding _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black,
            color: Colors.white,
            onPressed: _signInWithGoogle,
          ),
          const SizedBox(height: 9.0),
          SignInButton(
            text: 'Sign in with E-Mail',
            onPressed: () => _signInWithEmail(context),
            color: Colors.green,
            textColor: Colors.white,
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            'or',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 9.0),
          SignInButton(
            text: 'Continue as Guest',
            onPressed: _signInAnonymously,
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
