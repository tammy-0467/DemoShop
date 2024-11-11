import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme(
      surface: Colors.grey.shade300,
      primary: Colors.grey.shade200,
      secondary: Colors.white,
      inversePrimary: Colors.grey.shade700,
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.white,
      onPrimary: Colors.black,
      onSecondary: Colors.grey.shade700,
      onSurface: Colors.black,
  )
);