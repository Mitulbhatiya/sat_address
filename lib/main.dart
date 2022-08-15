import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primarySwatch: Colors.orange,
      colorScheme: ColorScheme.light(primary: Colors.orange),
      textTheme: TextTheme(
        bodyText2: TextStyle(fontWeight: FontWeight.w300, color: Colors.black),
        bodyText1: TextStyle(fontWeight: FontWeight.w300, color: Colors.orange),
      ),
    ),
  ));
}
