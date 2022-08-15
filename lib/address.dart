import 'package:flutter/material.dart';
import 'package:sat_address/edit_screen.dart';
import 'appbar.dart';
import 'database/database_helper.dart';
import 'database/sat.dart';

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
      body:  FutureBuilder<List<Sat>>(
        future: DatabaseHelper().retrieveTodos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.blue.shade50,
                    title: Text(snapshot.data![index].country!.toString()),
                    subtitle: Text(snapshot.data![index].state!.toString()),
                    trailing: InkWell(onTap: (){
                      _deleteTodo(Sat(id: snapshot.data![index].id));
                    },child: Icon(Icons.delete,color: Colors.red,)),
                    onTap: () {
                      _navigateToDetail(
                        context,
                        Sat(
                            country: snapshot.data![index].country,
                            state: snapshot.data![index].state),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Oops!"));
          }
          return CircularProgressIndicator();
        },
      ),


      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Column(
      //       children: [
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: _height / 9,
      //                 width: _width / 3,
      //                 alignment: Alignment.center,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     color: Colors.white,
      //                     boxShadow: [
      //                       BoxShadow(
      //                           blurRadius: 3,
      //                           spreadRadius: 2,
      //                           color: Colors.grey.shade200)
      //                     ]),
      //                 child: Text(
      //                   "Country: ${widget.country}",
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: _height / 9,
      //                 width: _width / 3,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     color: Colors.white,
      //                     boxShadow: [
      //                       BoxShadow(
      //                           blurRadius: 3,
      //                           spreadRadius: 2,
      //                           color: Colors.grey.shade200)
      //                     ]),
      //                 alignment: Alignment.center,
      //                 child: Text(
      //                   "State: ${widget.state}",
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Row(
      //           children: [
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: _height / 9,
      //                 width: _width / 3,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     color: Colors.white,
      //                     boxShadow: [
      //                       BoxShadow(
      //                           blurRadius: 3,
      //                           spreadRadius: 2,
      //                           color: Colors.grey.shade200)
      //                     ]),
      //                 alignment: Alignment.center,
      //                 child: Text(
      //                   "City: ${widget.city}",
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: Container(
      //                 height: _height / 9,
      //                 width: _width / 3,
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(20),
      //                     color: Colors.white,
      //                     boxShadow: [
      //                       BoxShadow(
      //                           blurRadius: 3,
      //                           spreadRadius: 2,
      //                           color: Colors.grey.shade200)
      //                     ]),
      //                 alignment: Alignment.center,
      //                 child: Text(
      //                   "_pincode: ${widget.pincode}",
      //                   style: TextStyle(fontWeight: FontWeight.bold),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

_deleteTodo(Sat sat) {
  DatabaseHelper.instance.deleteTodo(sat.id!);
}

_navigateToDetail(BuildContext context, Sat sat) async {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Edit_Screen(sat: sat)),
  );
}

