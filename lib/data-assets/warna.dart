import 'package:flutter/material.dart';

const ijoGelap = Color(0xFF208320);
const ijoTerang = Color(0xFF32CD32);
const ijoDark = Color(0xFF175E17);
const putih = Color(0xFFFAF8FC);
const orange = Color(0xFFE6704A);
const bgDetail = Color(0xFF4ec6ad);

ThemeData appWhite = ThemeData(
  brightness: Brightness.light,
  primaryColor: ijoTerang,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    backgroundColor: ijoTerang,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
);

ThemeData appDark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: ijoDark,
  scaffoldBackgroundColor: ijoDark,
  appBarTheme: const AppBarTheme(
    backgroundColor: ijoDark,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: putih),
    bodyText2: TextStyle(color: putih),
  ),
);
