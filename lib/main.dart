import 'package:flutter/material.dart';
import 'package:flutter_library/core/navigator/navigator.dart';
import 'package:flutter_library/core/scroll/custom_scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NW Library',
      scrollBehavior: CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: Colors.white.withOpacity(.9),
          filled: true,
        ),
      ),
      onGenerateRoute: CustomNavigator.onGenerateRoute,
    );
  }
}
