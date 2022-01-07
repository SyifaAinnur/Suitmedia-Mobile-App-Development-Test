import 'package:flutter/material.dart';

class CustomTextInputFormField extends StatelessWidget {
  CustomTextInputFormField({required this.controller, required this.decoration});

  final TextEditingController controller;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: decoration,
    );
  }
}
