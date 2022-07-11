import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_project/common_widgets/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    super.key,
    required String text,
    required VoidCallback onPressed,
  }) : super(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          height: 44.0,
          color: Colors.blue,
          borderRadius: 14.0,
          onPressed: onPressed,
        );
}
