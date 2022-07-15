import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/email_sign_in_page.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/sign_in_bloc.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/sign_in_button.dart';
import 'package:time_tracker_flutter_project/App/Sign_In/social_sign_in_button.dart';
import 'package:time_tracker_flutter_project/App/services/auth.dart';
import 'package:time_tracker_flutter_project/common_widgets/show_exception_alert_dialog.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key, required this.bloc});

  final SignInBloc bloc;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return Provider<SignInBloc>(
      create: (_) => SignInBloc(auth: auth),
      dispose: (_, bloc) => bloc.dispose(),
      child: Consumer<SignInBloc>(
        builder: (_, bloc, __) => SignInPage(bloc: bloc),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(context,
        title: 'Sign In Failed', exception: exception);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      await bloc.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } 
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await bloc.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } 
  }

  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => const EmailSignInPage(),
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
        body: StreamBuilder<bool>(
            stream: bloc.isLoadingStream,
            initialData: false,
            builder: (context, snapshot) {
              return _buildContent(context, snapshot.data);
            }),
        backgroundColor: const Color.fromARGB(220, 255, 255, 255));
  }

  Padding _buildContent(BuildContext context, bool? isLoading) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50.0,
            child: _buildHeader(isLoading!),
          ),
          const SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: 'images/google-logo.png',
            text: 'Sign in with Google',
            textColor: Colors.black,
            color: Colors.white,
            onPressed: () => _signInWithGoogle(context),
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
            onPressed: () => _signInAnonymously(context),
            color: Colors.blue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isLoading) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 28.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
