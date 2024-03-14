import 'package:flutter/material.dart';

const primaryColor = Color(0xffF4C314);

final darkTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headlineLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  ),
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
  ),
  canvasColor: const Color(0xffF4C314),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.white,
      size: 30,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.yellow,
    size: 30,
  ),
  cardColor: Colors.grey[800],
  focusColor: Colors.black,
  dialogBackgroundColor: Colors.black54,
  highlightColor: Colors.white,
);

final lightTheme = ThemeData(
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    titleMedium: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
    ),
  ),
  useMaterial3: true,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: Colors.grey[200],
  colorScheme: ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
  ),
  canvasColor: const Color(0xffF4C314),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(
      color: Colors.black,
      size: 30,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
    size: 30,
  ),
  cardColor: Colors.grey[300],
  focusColor: Colors.black,
  dialogBackgroundColor: Colors.white,
  highlightColor: Colors.black,
);

const textTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  ),
  headlineLarge: TextStyle(
    fontSize: 21,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
  ),
);
