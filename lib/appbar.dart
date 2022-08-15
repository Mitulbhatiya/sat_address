import 'package:flutter/material.dart';

class APPBAR extends StatefulWidget {
  const APPBAR({Key? key}) : super(key: key);

  @override
  State<APPBAR> createState() => _APPBARState();
}

class _APPBARState extends State<APPBAR> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Jay Shree Swaminarayan",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
      ),
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
