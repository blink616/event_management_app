import 'dart:async';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nust_hub_1/screens/society.dart';
import 'package:nust_hub_1/screens/ProfilePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/ExploreEvents.dart';

class Home extends StatefulWidget {
  final UserModel? user;
   Home( {this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  String currentUser = "";

  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      print(loggedInUser.name);
      setState(() {
        currentUser = loggedInUser.name!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Widget> _widgetOptions = <Widget>[
      Societies(),
      Explore(),
      ProfilePage(user: loggedInUser),
    ];

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.informationOutline),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.draw),
            label: 'AR Draw',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.mapMarker),
            label: 'Explore',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(0, 0, 0, 1),
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, .3),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}



// showDialog( context: context, builder: (BuildContext context) =>
//         AlertDialog(
//   title: Text("Share your art"),
//   content:
//       SingleChildScrollView(
//           child: Column(
//     children: [
//       TextField(
//         decoration:
//             new InputDecoration(
//                 hintText:
//                     'Event Name'),
//         onChanged: (value) =>
//             setState(() {
//           event_name =
//               value;
//         }),
//       ),
//       TextField(
//         decoration:
//             new InputDecoration(
//                 hintText:
//                     'Society Name'),
//         onChanged: (value) =>
//             setState(() {
//           event_name =
//               value;
//         }),
//       ),
//       DropdownButton<String>(
//       value: dropdownValue,
//       icon: const Icon(Icons.arrow_downward),
//       elevation: 16,
//       style: const TextStyle(color: Colors.deepPurple),
//       underline: Container(
//         height: 2,
//         color: Colors.deepPurpleAccent,
//       ),
//       onChanged: (String? newValue) {
//         setState(() {
//           dropdownValue = newValue!;
//         });
//       },
//       items: <String>['ACM', 'NLF', 'NMC', 'AIESEC']
//           .map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     )
          
//     ],
  

//           Add your onPressed code here!
//       }