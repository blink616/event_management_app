import 'dart:async';
import 'package:flutter/material.dart';

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
  //editting field controller
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController deptController = new TextEditingController();
  TextEditingController aboutController = new TextEditingController();

  //societies list
  //dropdown of societies
  final items = ['NCSC', 'NMX', 'ACM', 'NFAC', 'AIESEC', 'IEEE', 'NCBS', 'NMC'];

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
    List<String> result = [nameController.text, emailController.text,deptController.text,aboutController.text];
    Navigator.pop(context, result);
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
              padding: EdgeInsets.only(right:30,bottom:30,left:30),
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
                    children: const <Widget>[
                      Text("SOCIETIES",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ],
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
      bottomNavigationBar: Row(
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
    );
  }
}
