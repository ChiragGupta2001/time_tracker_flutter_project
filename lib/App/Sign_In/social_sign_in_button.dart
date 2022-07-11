import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    required this.assetName,
    required this.text,
    super.color,
    this.textColor = Colors.black,
    required super.onPressed,
    super.key,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(assetName),
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: textColor,
                ),
              ),
              Opacity(opacity: 0.0, child: Image.asset(assetName)),
            ],
          ),
        );

  final String text;
  final String assetName;
  final Color textColor;
}
