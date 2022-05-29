import 'dart:async';
import 'package:flutter/material.dart';
import 'editPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfilePage extends StatefulWidget {
  var loggedInUser;
  ProfilePage({Key? key, @required this.loggedInUser}) : super(key: key);

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  //firebase authorization
  final _auth = FirebaseAuth.instance;

  //variables
  var name ;
  var email;
  var dept;
  var about;
  var societies;

  @override
  void initState() {
    //super.initState();
    print("THISSS" + widget.loggedInUser.name);
    name = widget.loggedInUser.name;
    email = widget.loggedInUser.email;
    dept = widget.loggedInUser.dept;
    about = widget.loggedInUser.about;
    societies = widget.loggedInUser.societies;
  }

  //function to create societies row
  Widget _buildRow(String sname) {
    return Container(
      height: 40,
      width: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.blue,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(0),
      child: Text(
        sname,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  //function to push edit page in navigator
  void editPageFunction() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              EditPage(name: name, dept: dept, email: email, about: about, societies:societies)),
    );

    setState(() {
      name = result[0];
      email = result[1];
      dept = result[2];
      about = result[3];
      societies = result[4];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery. of(context). size. height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 300,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 120),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 150),
                        const CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              AssetImage('assets/images/profile.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                        const SizedBox(width: 5),
                        CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                            icon: const Icon(Icons.edit_outlined),
                            onPressed: editPageFunction,
                            tooltip: 'edit Page',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      name,
                      style: const TextStyle(fontSize: 25, color: Colors.black),
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 30, right: 30, bottom: 30),
                //height: 375,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 40,

                      //color: Colors.grey[200],
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        //color: Colors.grey[200],
                        //color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Icon(
                              Icons.email,
                            ),
                            SizedBox(width: 5),
                            Text(email),
                            SizedBox(width: 20),
                            Text("|"),
                            SizedBox(width: 20),
                            const Icon(
                              Icons.house,
                            ),
                            SizedBox(width: 2),
                            Text(dept),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    // const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(10),
                      //height: 100,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Text('SOCIETIES',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          Wrap(
                            spacing: 10.0,
                            runSpacing: 20.0,
                            children: <Widget>[
                              for (var item in societies) _buildRow(item),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 1,
                        ),
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.only(
                          top: 10, right: 15, left: 15, bottom: 30),
                      child: Column(
                        children: <Widget>[
                          Text('ABOUT',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 15),
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  about,
                                  textAlign: TextAlign.center,
                                  maxLines: 5,
                                  softWrap: true,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
