import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditPage extends StatefulWidget {
  var name;
  var email;
  var dept;
  var about;
  var societies;

  EditPage(
      {Key? key,
      @required this.name,
      @required this.dept,
      @required this.about,
      @required this.email,
      @required this.societies})
      : super(key: key);

  @override
  EditPageState createState() => EditPageState();
}

class EditPageState extends State<EditPage> {
  //firebase authorization
  final _auth = FirebaseAuth.instance;

  //editting field controller
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController deptController = new TextEditingController();
  TextEditingController aboutController = new TextEditingController();

  //societies list
  //dropdown of societies
  // a list of selectable items
  // these items can be hard-coded or dynamically fetched from a database/API
  List<String> _selectedItems = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'AIESEC',
      'IEEE',
      'NCBS',
      'NMC',
      'NCSC',
      'NMX',
      'ACM',
      'NFAC'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController = new TextEditingController(text: widget.name);
    emailController = new TextEditingController(text: widget.email);
    deptController = new TextEditingController(text: widget.dept);
    aboutController = new TextEditingController(text: widget.about);
  }

  //function to pop edit page in navigator
  void popEditPageFunction() {
    print(nameController.text);
    print(emailController.text);
    print(deptController.text);
    print(aboutController.text);
    var result = [
      nameController.text,
      emailController.text,
      deptController.text,
      aboutController.text,
      _selectedItems,
    ];

    postDetailsToFirestore();

    Navigator.pop(context, result);
  }


  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.name = nameController.text;
    userModel.email = emailController.text;
    userModel.dept = deptController.text;
    userModel.about = aboutController.text;
    userModel.societies = _selectedItems;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  Row(
                    children: const <Widget>[
                      SizedBox(width: 150),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(children: <Widget>[
                    const SizedBox(width: 150),
                    Container(
                      width: 200,
                      color: Colors.white,
                      child: TextField(
                        controller: nameController,
                        style: const TextStyle(
                          height: 0,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        maxLength: 15,
                        decoration: InputDecoration(
                          counter: Container(),
                          border: InputBorder.none,
                          hintText: widget.name,
                          hintStyle: const TextStyle(
                              height: null, fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 30, bottom: 30, left: 30),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.email,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: emailController,
                          style: const TextStyle(
                            height: 2,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          maxLength: 40,
                          decoration: InputDecoration(
                            counter: Container(),
                            border: InputBorder.none,
                            hintText: widget.email,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.house,
                      ),
                      SizedBox(
                        width: 300,
                        child: TextField(
                          controller: deptController,
                          style: const TextStyle(
                            height: 2,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          maxLength: 40,
                          decoration: InputDecoration(
                            counter: Container(),
                            border: InputBorder.none,
                            hintText: widget.dept,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 15),
                  Row(
                    children: const <Widget>[
                      Text("ABOUT",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                          width: 300,
                          child: TextField(
                            controller: aboutController,
                            style: const TextStyle(
                              height: 2,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            maxLength: 255,
                            maxLines: 5,
                            decoration: InputDecoration(
                              counter: Container(),
                              border: InputBorder.none,
                              hintText: widget.about,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          side: BorderSide(
                            width: 1.0,
                            color: Colors.black,
                          ),
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 50, vertical: 20),
                        ),
                        child: const Text('Select list of Societies',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        onPressed: _showMultiSelect,
                      ),
                      const Divider(
                        height: 30,
                      ),
                      // display selected items
                    ],
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 10.0,
                    runSpacing: 20.0,
                    children: _selectedItems
                        .map((e) => Chip(
                              label: Text(e),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 15),
                  const Divider(color: Colors.black),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 30, right: 30, left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                popEditPageFunction();
              },
              child: const Text('SAVE'),
            ),
          ],
        ),
      ),
    );
  }
}

class MultiSelect extends StatefulWidget {
  final List<String> items;

  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}
