import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomRaisedButton {
  SignInButton({
    required this.text,
    super.color,
    this.textColor = Colors.black,
    required super.onPressed,
    super.key,
  }) : super(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 15.0),
          ),
        );

  final String text;
  final Color textColor;
}
