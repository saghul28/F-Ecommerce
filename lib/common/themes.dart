// lib/app_theme.dart

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xFFF83758),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
        bodySmall: TextStyle(
            color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: Color.fromARGB(255, 14, 14, 14),
            fontSize: 30,
            fontWeight: FontWeight.w700),
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Color.fromARGB(103, 67, 67, 66)),
        prefixIconColor: Color.fromARGB(103, 32, 32, 32),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Color.fromARGB(168, 168, 169, 100))),
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
          style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Color(0xFFF83758)),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
      )));

  // static ThemeData darkTheme = ThemeData(
  //   primarySwatch: Colors.teal,

  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   textTheme: const TextTheme(
  //     bodyText1: TextStyle(color: Colors.white, fontSize: 16),
  //     bodyText2: TextStyle(color: Colors.white70, fontSize: 14),
  //     headline1: TextStyle(
  //         color: Colors.teal, fontSize: 24, fontWeight: FontWeight.bold),
  //   ),
  //   scaffoldBackgroundColor: Colors.black,
  // );
}
