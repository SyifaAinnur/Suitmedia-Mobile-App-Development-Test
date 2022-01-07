import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "Lato",
    textTheme: TextTheme(
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w900,
        color: Colors.black,
        height: 1,
      ),
    ),
  );
}
