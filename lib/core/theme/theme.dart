import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTheme {
  static const primaryColor = Color(0xFF3F51B5);
  static const secundaryColor = Color(0xFF695310);

  static ThemeData theme() {
    return ThemeData(
      primarySwatch: Colors.indigo,
      appBarTheme: const AppBarTheme(centerTitle: true),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        fillColor: Colors.white.withOpacity(.9),
        filled: true,
      ),
    );
  }
}
