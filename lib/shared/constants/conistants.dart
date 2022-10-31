import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

String token = '';

ThemeData lightTheme() => ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white.withOpacity(.0),
      statusBarIconBrightness: Brightness.dark,
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    color: Colors.white,
    elevation: 0,
  ),
);