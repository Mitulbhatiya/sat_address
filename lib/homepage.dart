import 'package:flutter/material.dart';
import 'appbar.dart';
import 'country.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

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
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: _height / 2,
                  width: _width / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    image: DecorationImage(
                      image: NetworkImage('https://play-lh.googleusercontent.com/GTp-YNp6YpZrwRmoq0lfUcFRRuoMhCFpvybjHAhnN0DXd7ISFcBNZvGEYhOpNeFgTA=w240-h480-rw'),
                    ),
                  ),
                  ),
                SizedBox(
                  width: _width / 25,
                ),
                Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.orange.shade400,
                          fontWeight: FontWeight.w300,
                        ),
                        text: 'SAT',
                        children: [
                          TextSpan(text: '\nUniversal'),
                          TextSpan(text: '\nAddress')
                        ])),
                SizedBox(
                  width: _width / 25,
                ),
                Container(
                  height: _height / 2,
                  width: _width / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50)),
                    image: DecorationImage(
                        image: NetworkImage('https://scontent.famd15-1.fna.fbcdn.net/v/t31.18172-8/11312669_847588125321615_8899710617141802015_o.jpg?stp=cp0_dst-jpg_e15_q65_s320x320&_nc_cat=1&ccb=1-7&_nc_sid=85a577&_nc_ohc=0NJEFF78h-wAX-htSdP&_nc_oc=AQkqkuNlWj4o99SrohFHCWhs5kJBUJIE6hBcAOp-DtpD8nY_K2gsllMDiXDr_4jNJobG90arJh8p0KLQG3CryAu5&_nc_ht=scontent.famd15-1.fna&oh=00_AT9CvR6aJ25prS5C62MmI34-W_u1ax6uUcFoLdPrV1KAXw&oe=631F9853')),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter the Username',
                          prefixIcon: Icon(Icons.person),
                          label: Text("Username"),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w300,
                          ),
                          iconColor: Colors.orange,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                            return 'Enter a valid email!';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter the password',
                          prefixIcon: Icon(Icons.lock),
                          label: Text("Password"),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w300,
                          ),
                          iconColor: Colors.orange,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 3,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          //Validator
                        },
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                  .hasMatch(value)) {
                            return 'Enter a valid password!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: _width / 2,
                      height: _height / 15,
                      child: ElevatedButton(
                        onPressed: () {
                          final isValid = _formKey.currentState?.validate();
                          if (!isValid!) {
                            return;
                          }
                          _formKey.currentState?.save();
                          _formKey.currentState?.reset();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Country();
                          }));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(), primary: Colors.orange),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
