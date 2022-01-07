import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  CustomButton({
    required this.text,
    required this.onPressed ,
    required this.style,
  });

  final Widget text;
  final VoidCallback onPressed;
  final ButtonStyle style;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: widget.text,
      onPressed: widget.onPressed,
      style: widget.style,
    );
  }
}
