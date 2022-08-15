import 'dart:math';

import 'package:flutter/material.dart';
import 'address.dart';
import 'appbar.dart';
import 'database/database_helper.dart';
import 'database/sat.dart';

class Edit_Screen extends StatefulWidget {

  final Sat? sat;

  Edit_Screen({Key? key,this.sat}) : super(key: key);

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState(sat!);
}

class _Edit_ScreenState extends State<Edit_Screen> {
  Sat? sat;
  int _activeCurrentStep = 0;

  TextEditingController _country = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _pincode = TextEditingController();

  _Edit_ScreenState(Sat sat);



  void initState() {
    super.initState();
    if (sat != null) {
      _country.text = sat!.country!;
      _state.text = sat!.state!;
      _city.text = sat!.city!;
      _pincode.text=sat!.pincode!;
    }
  }
  @override
  void dispose() {
    super.dispose();
    _country.dispose();
    _state.dispose();
    _city.dispose();
    _pincode.dispose();
  }

  List<Step> stepList() => [
    Step(
      state:
      _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 0,
      title: const Text('Country'),
      content: Container(
        child: Form(
          child: TextField(
            controller: _country,
            decoration: InputDecoration(
              hintText: 'Country Name',
              prefixIcon: Icon(Icons.language_outlined),
              hintStyle: TextStyle(
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
          ),
        ),
      ),
    ),
    Step(
        state: _activeCurrentStep <= 1
            ? StepState.editing
            : StepState.complete,
        isActive: _activeCurrentStep >= 1,
        title: const Text('State'),
        content: Container(
          child: Form(
            child: Column(
              children: [
                TextField(
                  controller: _state,
                  decoration: InputDecoration(
                    hintText: 'State Name',
                    prefixIcon: Icon(Icons.language_outlined),
                    hintStyle: TextStyle(
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
                ),
              ],
            ),
          ),
        )),
    Step(
      state:
      _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 2,
      title: const Text('City'),
      content: Container(
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: _city,
                decoration: InputDecoration(
                  hintText: 'City Name',
                  prefixIcon: Icon(Icons.language_outlined),
                  hintStyle: TextStyle(
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
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: _pincode,
                decoration: InputDecoration(
                  hintText: '_pincode',
                  prefixIcon: Icon(Icons.lock_open_rounded),
                  hintStyle: TextStyle(
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
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    ),
    Step(
      state: StepState.complete,
      isActive: _activeCurrentStep >= 3,
      title: const Text(
        'Confirm',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      content: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Name: ${_country.text}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Text(
              'Email: ${_state.text}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Text(
              'Password: ${_city.text}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
            Divider(
              color: Colors.transparent,
            ),
            Text(
              '_pincode : ${_pincode.text}',
              style: TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: APPBAR(),
      ),
      body: Stepper(
        currentStep: _activeCurrentStep,
        steps: stepList(),
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                if (_activeCurrentStep < 3)
                  ElevatedButton(
                      onPressed: controls.onStepContinue,
                      child: const Text(
                        'NEXT',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                if (_activeCurrentStep >= 3)
                  ElevatedButton(
                    onPressed: () {
                      var route = MaterialPageRoute(builder: (context) {
                        return AddScreen(
                          country: _country.text,
                          city: _city.text,
                          pincode: _pincode.text,
                          state: _state.text,
                        );
                      });

                      _saveTodo(_country.text, _state.text,_city.text,_pincode.text);
                      Navigator.of(context).push(route);
                    },
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                if (_activeCurrentStep != 0)
                  TextButton(
                    onPressed: controls.onStepCancel,
                    child: const Text(
                      'BACK',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        onStepContinue: () {
          if (_activeCurrentStep < (stepList().length - 1)) {
            setState(() {
              _activeCurrentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_activeCurrentStep == 0) {
            return;
          }

          setState(() {
            _activeCurrentStep -= 1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeCurrentStep = index;
          });
        },
      ),
    );
  }

  _saveTodo(String country, String state, String city, String pincode) async {
    if (Sat == null) {
      DatabaseHelper.instance.insertTodo(Sat(
          country: _country.text,
          state: _state.text,
          city: _city.text,
          pincode: _pincode.text,

      ));
      Navigator.pop(context, "Your todo has been saved.");
    } else {
      await DatabaseHelper.instance
          .updateTodo(Sat(
          // id: Sat.id,
          country: country, state: state,city: city,pincode: pincode));
      Navigator.pop(context);
    }
  }
}
