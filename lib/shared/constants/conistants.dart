import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

late String token;

ThemeData lightTheme() => ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: Colors.grey[100],
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.0),
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: const TextStyle(
      color: Color(0xff1e4558),
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.blueGrey[300],
    ),
    color: Colors.grey[100],
    elevation: 0,
  ),
);

// Color(0xff1e4558) DarkBlue
// Color(0xffdc4753) Red
// Colors.blueGrey[200 : 700]
// Colors.grey[100]