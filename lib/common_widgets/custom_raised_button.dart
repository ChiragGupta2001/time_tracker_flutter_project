import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  const CustomRaisedButton(
      {super.key,
      required this.child,
      this.color = Colors.blue,
      this.borderRadius = 9.0,
      this.height = 44.0,
      required this.onPressed});

  final Widget child;
  final Color? color;
  final double? borderRadius;
  final VoidCallback onPressed;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color, // background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(borderRadius!),
            ),
          ),
        ),
        child: child,
      ),
    );
  }
}
