import 'package:flutter/material.dart';
import 'appbar.dart';

class AddScreen extends StatefulWidget {
  final String country;
  final String state;
  final String city;
  final String pincode;

  const AddScreen(
      {Key? key,
      required this.country,
      required this.city,
      required this.pincode,
      required this.state})
      : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: APPBAR(),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _height / 9,
                      width: _width / 3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade200)
                          ]),
                      child: Text(
                        "Country: ${widget.country}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _height / 9,
                      width: _width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade200)
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "State: ${widget.state}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _height / 9,
                      width: _width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade200)
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "City: ${widget.city}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: _height / 9,
                      width: _width / 3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 2,
                                color: Colors.grey.shade200)
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                        "Pincode: ${widget.pincode}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
